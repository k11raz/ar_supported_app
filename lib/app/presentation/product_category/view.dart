import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:bus/app/domain/usecases/products/search_product.dart';
import 'package:bus/app/presentation/search/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductCategoryView extends StatelessWidget {
  final CategoryEntity category;
  const ProductCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (_) => ProductsBloc(
          GetProducts(ProductRepositoryImpl(SupabaseProductRemoteDatasource())),
          GetSearchProducts(ProductRepositoryImpl(SupabaseProductRemoteDatasource())),
        )..add(FetchProductsByCategoryEvent(category.id)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).fieldCustom,
              elevation: 0,
              pinned: false,
              floating: true,
              leading: IconButton(
                icon: const BackButtonIcon(),
                onPressed: () => context.router.back(),
              ),
              title: Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return buildScrollableSheet();
                      },
                    );
                  },
                  child: Text(
                    "Filtreler",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                const SizedBox(width: 16),
              ],
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
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
                    padding: const EdgeInsets.all(24),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 0.56,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final product = state.products[index];
                        return ProductCard(
                          product: product,
                          imagePath: "image/images/img1.jpg",
                          images: const [
                            "image/images/img1.jpg",
                            "image/images/img2.jpg",
                            "image/images/img2.jpg",
                          ],
                        );
                      }, childCount: state.products.length),
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScrollableSheet() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Exit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
