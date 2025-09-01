import 'dart:developer';

import 'package:bus/app/domain/entities/favorites_entity.dart';
import 'package:bus/app/domain/usecases/favorites/add_to_favorites.dart';
import 'package:bus/app/domain/usecases/favorites/check_favorite.dart';
import 'package:bus/app/domain/usecases/favorites/get_favorites.dart';
import 'package:bus/app/domain/usecases/favorites/remove_favorites_usecase.dart';
import 'package:bus/app/presentation/favorites/event.dart';
import 'package:bus/app/presentation/favorites/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  AddToFavoritesUseCase addToFavoritesUseCase;
  GetFavorites getFavorites;
  CheckFavoriteUseCase checkFavoriteUseCase;
  RemoveFavoritesUsecase removeFavoritesUsecase;

  FavoritesBloc({
    required this.addToFavoritesUseCase,
    required this.getFavorites,
    required this.checkFavoriteUseCase,
    required this.removeFavoritesUsecase,
  }) : super(FavoritesInitial()) {
    on<AddProductToFavoritesEvent>(_onAddProduct);
    on<FetchFavoritesEvent>(_onLoadFavoritesItems);
    on<CheckFavoritesEvent>(checkFavorites);
    on<ToggleFavoritesEvent>(toggleFavorite);
    on<RemoveFavoritesEvent>(removeFavorite);
  }

  Future<void> removeFavorite(
    RemoveFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

     try {
    await removeFavoritesUsecase(id: event.id);

    final updatedFavorites = await getFavorites();
    emit(FavoritesLoaded(updatedFavorites));
  } catch (e) {
    emit(FavoritesFailure(e.toString()));
  }


  }

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
      log('FetchFavoriteEvent error: $e', stackTrace: s);
      emit(FavoritesFailure('Favori Ürünler yüklenemedi.'));
    }
  }

  Future<void> checkFavorites(
    CheckFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final isFavorite = await checkFavoriteUseCase(event.productId);
      emit(FavoritesChecked(isFavorite));
    } catch (e) {
      log('FetchFavoriteEvent error: $e');
      emit(FavoritesFailure('Favori Ürünler yüklenemedi.'));
    }
  }

  Future<void> toggleFavorite(
    ToggleFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final favorites = await getFavorites();

      final isFavorite = favorites.any(
        (item) => item.productId == event.product.id,
      );

      if (isFavorite) {
        await removeFavoritesUsecase(id: event.product.id);
      } else {
        await addToFavoritesUseCase(product: event.product);
      }

      final updatedFavorites = await getFavorites();
      emit(FavoritesLoaded(updatedFavorites));
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }
}
