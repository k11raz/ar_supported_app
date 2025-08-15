import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends ProductsEvent {}

class FetchProductsByCategoryEvent extends ProductsEvent {
  final String categoryId;

  const FetchProductsByCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class SearchProductEvent extends ProductsEvent {
  final String query;
  const SearchProductEvent(this.query);

  @override
  List<Object> get props => [query];
}
