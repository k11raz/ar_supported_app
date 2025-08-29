import 'dart:developer';

import 'package:bus/app/domain/entities/order_items_entity.dart';
import 'package:bus/app/domain/usecases/basket/add_to_card.dart';
import 'package:bus/app/domain/usecases/basket/get_order_items.dart';
import 'package:bus/app/domain/usecases/basket/remove_basket_usecase.dart';
import 'package:bus/app/presentation/product_detail/widgets/event.dart';
import 'package:bus/app/presentation/product_detail/widgets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  AddToCartUseCase addToCartUseCase;
  GetOrderItems getOrderItems;
  RemoveOrderItemUseCase removeOrderItemUseCase;
  CardBloc({
    required this.addToCartUseCase,
    required this.getOrderItems,
    required this.removeOrderItemUseCase,
  }) : super(CardInitial()) {
    on<AddProductToCardEvent>(_onAddProduct);
    on<RemoveProductFromCardEvent>(_onRemoveProduct);
    on<FetchOrderItemsEvent>(_onLoadOrderItems);
  }

  final orderId = Uuid().v4();

  Future<void> _onAddProduct(
    AddProductToCardEvent event,
    Emitter<CardState> emit,
  ) async {
    emit(CardLoading());

    try {
      List<OrderItemsEntity> updatedItems = [];

      if (state is CardSuccess) {
        updatedItems = List.from((state as CardSuccess).items);
      }

      final index = updatedItems.indexWhere(
        (i) => i.productId == event.product.id,
      );

      if (index != -1) {
        final existing = updatedItems[index];
        updatedItems[index] = OrderItemsEntity(
          id: existing.id,
          orderId: existing.orderId,
          productId: existing.productId,
          quantity: existing.quantity + event.quantity,
          priceAtTime: existing.priceAtTime,
        );
      } else {
        updatedItems.add(
          OrderItemsEntity(
            id: event.product.id,
            orderId: orderId,
            productId: event.product.id,
            quantity: event.quantity,
            priceAtTime: event.product.price.toInt(),
          ),
        );
      }

      await addToCartUseCase(product: event.product, quantity: event.quantity);

      emit(CardSuccess(items: updatedItems));
    } catch (e) {
      emit(CardFailure(e.toString()));
    }
  }

  Future<void> _onLoadOrderItems(
    FetchOrderItemsEvent event,
    Emitter<CardState> emit,
  ) async {
    emit(CardLoading());
    try {
      final data = await getOrderItems();
      emit(CardLoaded(data));
    } catch (e, s) {
      log('FetchProductsEvent error: $e', stackTrace: s);
      emit(CardFailure('Ürünler yüklenemedi.'));
    }
  }

  Future<void> _onRemoveProduct(
    RemoveProductFromCardEvent event,
    Emitter<CardState> emit,
  ) async {
    emit(CardLoading());
    try {
      await removeOrderItemUseCase(id: event.id);

      final updatedFavorites = await getOrderItems();
      emit(CardLoaded(updatedFavorites));
    } catch (e) {
      log('FetchProductsEvent error: $e');
      emit(CardFailure('Ürünler yüklenemedi.'));
    }
  }
}
