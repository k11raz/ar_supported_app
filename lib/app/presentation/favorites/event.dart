import 'package:bus/app/app.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavoritesEvent extends FavoritesEvent {}

class AddProductToFavoritesEvent extends FavoritesEvent {
  final ProductEntity product;

  const AddProductToFavoritesEvent({required this.product});

  @override
  List<Object?> get props => [product];
}

class CheckFavoritesEvent extends FavoritesEvent {
  final String productId;

  const CheckFavoritesEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class RemoveFavoritesEvent extends FavoritesEvent {
  final String id;

  const RemoveFavoritesEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class ToggleFavoritesEvent extends FavoritesEvent {
  final ProductEntity product;
  const ToggleFavoritesEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
