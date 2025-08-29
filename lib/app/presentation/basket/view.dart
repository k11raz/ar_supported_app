import 'package:auto_route/auto_route.dart';
import 'package:bus/app/domain/usecases/basket/remove_basket_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../app.dart';

@RoutePage()
class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => CardBloc(
        addToCartUseCase: sl<AddToCartUseCase>(),
        getOrderItems: sl<GetOrderItems>(),
        removeOrderItemUseCase: sl<RemoveOrderItemUseCase>(),
      )..add(FetchOrderItemsEvent()),
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
                          return Slidable(
                            key: ValueKey(item.orderId),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: 0.20,
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.read<CardBloc>().add(
                                      RemoveProductFromCardEvent(
                                        id: item.orderItemId,
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Sil',
                                ),
                              ],
                            ),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: NColors.black,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                      child: Image.network(
                                        item.imageUrl,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${item.price} TL",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Colors.grey[700],
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
