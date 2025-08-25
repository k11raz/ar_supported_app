import 'package:auto_route/auto_route.dart';
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
          CardBloc(addToCartUseCase: addToCartUseCase, getOrderItems: getOrderItemsUseCase)
            ..add(FetchOrderItemsEvent()),
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
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
