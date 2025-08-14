import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:bus/app/data/datasources/remote/category.dart';
import 'package:bus/app/data/datasources/remote/product.dart';
import 'package:bus/app/data/repositories/category_impl.dart';
import 'package:bus/app/data/repositories/product_impl.dart';
import 'package:bus/app/domain/usecases/category/get_category.dart';
import 'package:bus/app/domain/usecases/products/get_product.dart';
import 'package:bus/app/presentation/category/bloc.dart';
import 'package:bus/app/presentation/category/event.dart';
import 'package:bus/app/presentation/category/state.dart';
import 'package:bus/app/presentation/search/bloc.dart';
import 'package:bus/app/presentation/search/event.dart';
import 'package:bus/app/presentation/search/state.dart';
import 'package:bus/app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
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
                            return Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Text(
                                category.name,
                                style: textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),

              const SizedBox(height: 48),

              NSearchContainer(),

              const SizedBox(height: 48),
              const Divider(color: Colors.white24),
              const SizedBox(height: 48),

              Expanded(
                child: BlocProvider(
                  create: (_) => ProductsBloc(
                    GetProducts(
                      ProductRepositoryImpl(
                        SupabaseProductRemoteDatasource(),
                      ),
                    ),
                  )..add(FetchProductsEvent()),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
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
                            return _buildProductCard(
                              product.name,
                              product.price.toString(),
                              "image/images/img1.jpg",
                              textTheme,
                              context,
                              [
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

  Widget _buildProductCard(
    String name,
    String price,
    String imagePath,
    TextTheme textTheme,
    BuildContext context,
    List<String> images
  ) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailRoute(name: name, price: price,images: [
                                "image/images/img1.jpg",
                                "image/images/img2.jpg",
                                "image/images/img2.jpg",
                              ],));
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$price TL",
                      style:
                          textTheme.titleSmall?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
