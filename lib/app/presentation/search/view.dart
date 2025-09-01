import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 48),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: BlocProvider(
                  create: (_) => CategoryBloc(
                    getCategory: GetCategory(
                      CategoryRepositoryImpl(
                        SupabaseCategoryRemoteDatasource(dio: sl<Dio>()),
                      ),
                    ),
                  )..add(FetchCategoryEvent()),
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is CategoryError) {
                        return Center(
                          child: Text(
                            "Hata: ${state.message}",
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      if (state is CategoryLoaded) {
                        if (state.categories.isEmpty) {
                          return const Center(
                            child: Text(
                              "Henüz Kategori yok",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return CategoryCard(category: category);
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),

            // Arama Çubuğu
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocProvider(
                  create: (_) => ProductsBloc(
                    getProducts: GetProducts(
                      ProductRepositoryImpl(
                        SupabaseProductRemoteDatasource(dio: sl<Dio>()),
                      ),
                    ),
                    getSearchProducts: GetSearchProducts(
                      ProductRepositoryImpl(
                        SupabaseProductRemoteDatasource(dio: sl<Dio>()),
                      ),
                    ),
                  )..add(FetchProductsEvent()),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      return NSearchContainer(
                        controller: searchController,
                        onChanged: (value) {
                          context.read<ProductsBloc>().add(
                            SearchProductEvent(value),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 48),
            ),

            const SliverToBoxAdapter(
              child: Divider(color: Colors.white24),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 48),
            ),

            BlocProvider(
              create: (_) => ProductsBloc(
                getProducts: GetProducts(
                  ProductRepositoryImpl(
                    SupabaseProductRemoteDatasource(dio: sl<Dio>()),
                  ),
                ),
                getSearchProducts: GetSearchProducts(
                  ProductRepositoryImpl(
                    SupabaseProductRemoteDatasource(dio: sl<Dio>()),
                  ),
                ),
              )..add(FetchProductsEvent()),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is ProductsError) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "Hata: ${state.message}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }

                  if (state is ProductsLoaded) {
                    if (state.products.isEmpty) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "Henüz Ürün yok",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.56,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final product = state.products[index];
                            return ProductCard(
                              product: product,
                              imagePath: product.imageUrl,
                              images: [
                                "image/images/img1.jpg",
                                "image/images/img2.jpg",
                                "image/images/img2.jpg",
                              ],
                            );
                          },
                          childCount: state.products.length,
                        ),
                      ),
                    );
                  }

                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
