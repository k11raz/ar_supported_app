import 'dart:developer';
import 'package:bus/app/domain/usecases/basket/add_to_card.dart';
import 'package:bus/app/domain/usecases/basket/get_order_items.dart';
import 'package:bus/app/domain/usecases/basket/remove_basket_usecase.dart';
import 'package:bus/app/presentation/product_detail/widgets/event.dart';
import 'package:bus/app/presentation/product_detail/widgets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  

  Future<void> _onAddProduct(
  AddProductToCardEvent event,
  Emitter<CardState> emit,
) async {
  emit(CardLoading());
  try {
    await addToCartUseCase(product: event.product, quantity: event.quantity);

    final updatedItems = await getOrderItems();

    emit(CardLoaded(orders: updatedItems));

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
    
    emit(CardLoaded(orders: data));
  } catch (e, s) {
    log('FetchOrderEvent error: $e', stackTrace: s);
    emit(CardFailure('Ürünler yüklenemedi.'));
  }
}

  // Future<void> _onLoadOrderItems(
  //   FetchOrderItemsEvent event,
  //   Emitter<CardState> emit,
  // ) async {
  //   emit(CardLoading());
  //   try {
  //     final data = await getOrderItems();
  //     emit(CardLoaded(data));
  //   } catch (e, s) {
  //     log('FetchProductsEvent error: $e', stackTrace: s);
  //     emit(CardFailure('Ürünler yüklenemedi.'));
  //   }
  // }

  Future<void> _onRemoveProduct(
  RemoveProductFromCardEvent event,
  Emitter<CardState> emit,
) async {
  emit(CardLoading());
  try {
    await removeOrderItemUseCase(id: event.id);

    final updatedFavorites = await getOrderItems();
    
    emit(CardLoaded(orders: updatedFavorites));
  } catch (e) {
    log('RemoveEvent error: $e');
    emit(CardFailure('Ürünler yüklenemedi.'));
  }
}
}
