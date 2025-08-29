import 'package:bus/app/domain/entities/favorites_item_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoading extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoaded extends FavoritesState {
  final List<FavoritesItemEntity> favorites;
  const FavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoritesChecked extends FavoritesState {
  final bool isFavorite;
  const FavoritesChecked(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}

class FavoritesFailure extends FavoritesState {
  final String message;

  const FavoritesFailure(this.message);

  @override
  List<Object> get props => [message];
}
