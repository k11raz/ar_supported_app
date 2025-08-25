import 'package:bus/app/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  const ProductsState();

  ProductsState copyWith({int? count}) {
    return ProductsState();
  }

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;
  const ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
