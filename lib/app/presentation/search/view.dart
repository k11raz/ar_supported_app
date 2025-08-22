import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:bus/app/core/widgets/searchBar/search_anchor.dart';
import 'package:bus/app/domain/usecases/products/search_product.dart';
import 'package:bus/app/presentation/search/widgets/category_card.dart';
import 'package:bus/app/presentation/search/widgets/product_card.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

              SizedBox(
                height: 24,
                child: BlocProvider(
                  create: (_) => CategoryBloc(
                    GetCategory(
                      CategoryRepositoryImpl(
                        SupabaseCategoryRemoteDatasource(),
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

              const SizedBox(height: 48),

              BlocProvider<ProductsBloc>(
                create: (_) => ProductsBloc(
                  GetProducts(
                    ProductRepositoryImpl(SupabaseProductRemoteDatasource()),
                  ),
                  GetSearchProducts(
                    ProductRepositoryImpl(SupabaseProductRemoteDatasource()),
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

              const SizedBox(height: 48),
              const Divider(color: Colors.white24),
              const SizedBox(height: 48),

              Expanded(
                child: BlocProvider(
                  create: (_) => ProductsBloc(
                    GetProducts(
                      ProductRepositoryImpl(SupabaseProductRemoteDatasource()),
                    ),
                    GetSearchProducts(
                      ProductRepositoryImpl(SupabaseProductRemoteDatasource()),
                    ),
                  )..add(FetchProductsEvent()),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ProductsError) {
                        return Center(
                          child: Text(
                            "Hata: ${state.message}",
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      if (state is ProductsLoaded) {
                        if (state.products.isEmpty) {
                          return const Center(
                            child: Text(
                              "Henüz Ürün yok",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 0.56,
                              ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
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
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
