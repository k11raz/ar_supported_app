import 'package:auto_route/auto_route.dart';
import 'package:bus/app/data/datasources/remote/card.dart';
import 'package:bus/app/data/repositories/card_impl.dart';
import 'package:bus/app/domain/usecases/add_to_card.dart';
import 'package:bus/app/domain/usecases/basket/get_order_items.dart';
import 'package:bus/app/presentation/product_detail/widgets/bloc.dart';
import 'package:bus/app/presentation/product_detail/widgets/event.dart';
import 'package:bus/app/presentation/product_detail/widgets/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../app.dart';

@RoutePage()
class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    final cardRemoteDataSource = SupabaseCardRemoteDatasource();
    final cardRepository = CardRepositoryImpl(cardRemoteDataSource);
    final addToCartUseCase = AddToCartUseCase(cardRepository);
    final getOrderItemsUseCase = GetOrderItems(cardRepository);

    return BlocProvider(
      create: (_) =>
          CardBloc(addToCartUseCase, getOrderItemsUseCase)
            ..add(FetchOrderItemsEvent()), // Sepeti yükle
      child: BlocConsumer<CardBloc, CardState>(
        listener: (context, state) {
          if (state is CardFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message.toString())));
          }
          if (state is CardSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Sepet güncellendi")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: IAppBar(
              backgroundColor: Colors.black,
              title: const Text("My Basket"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Üst sekmeler
                  Row(
                    children: [
                      Text(
                        "SHOPPING BAG [${state is CardSuccess ? state.totalItems : 0}]",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          context.router.push(FavoritesRoute());
                        },
                        child: Text(
                          "FAVORITES",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  if (state is CardLoading) ...[
                    const Center(child: CircularProgressIndicator()),
                  ] else if (state is CardLoaded &&
                      state.orders.isNotEmpty) ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.orders.length,
                        itemBuilder: (context, index) {
                          final item = state.orders[index];
                          return ListTile(
                            leading: item.orderId != null
                                ? Image.network(item.imageUrl)
                                : const Icon(Icons.shopping_bag_outlined),
                            title: Text(item.name),
                            subtitle: Text("${item.price} TL"),
                            trailing: IconButton(
                              icon: const Icon(Iconsax.trash),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    // Sepet boşsa
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shopping_bag_outlined, size: 56),
                            SizedBox(height: 16),
                            Text("YOUR BAG IS EMPTY"),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Önerilen ürünler
                  const Text("YOU MAY ALSO LIKE"),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.56,
                      children: List.generate(4, (i) {
                        return InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset("image/images/img1.jpg"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Güral Porselen",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Iconsax.save_21),
                                  ),
                                ],
                              ),
                              Text(
                                "500.00 TL",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
