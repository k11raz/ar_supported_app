import 'package:bus/app/domain/entities/favorites.dart';
import 'package:bus/app/domain/entities/favorites_item.dart';
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

class FavoritesFailure extends FavoritesState {
  final String message;

  const FavoritesFailure(this.message);

  @override
  List<Object> get props => [message];
}
