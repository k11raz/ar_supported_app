import 'dart:developer';

import 'package:bus/app/domain/entities/favorites_entity.dart';
import 'package:bus/app/domain/usecases/favorites/add_to_favorites.dart';
import 'package:bus/app/domain/usecases/favorites/get_favorites.dart';
import 'package:bus/app/presentation/favorites/event.dart';
import 'package:bus/app/presentation/favorites/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  AddToFavoritesUseCase addToFavoritesUseCase;
  GetFavorites getFavorites;
  FavoritesBloc({required this.addToFavoritesUseCase,required this.getFavorites})
    : super(FavoritesInitial()) {
    on<AddProductToFavoritesEvent>(_onAddProduct);
    on<FetchFavoritesEvent>(_onLoadFavoritesItems);
  }

  final orderId = Uuid().v4();

  Future<void> _onAddProduct(
    AddProductToFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

    try {
      List<FavoritesEntity> updatedItems = [];

      final index = updatedItems.indexWhere(
        (i) => i.productId == event.product.id,
      );

      if (index != -1) {
        final existing = updatedItems[index];
        updatedItems[index] = FavoritesEntity(
          id: existing.id,
          productId: existing.productId,
          userId: null.toString(),
          createdAt: DateTime.now(),
        );
      } else {
        updatedItems.add(
          FavoritesEntity(
            id: event.product.id,
            productId: event.product.id,
            userId: null.toString(),
            createdAt: DateTime.now(),
          ),
        );
      }

      await addToFavoritesUseCase(product: event.product);
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }

  Future<void> _onLoadFavoritesItems(
    FetchFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final data = await getFavorites();
      emit(FavoritesLoaded(data));
    } catch (e, s) {
      log('FetchProductsEvent error: $e', stackTrace: s);
      emit(FavoritesFailure('Favori Ürünler yüklenemedi.'));
    }
  }
}
