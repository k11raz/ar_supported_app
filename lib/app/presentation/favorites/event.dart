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
  List<Object?> get props => [ product];
}
