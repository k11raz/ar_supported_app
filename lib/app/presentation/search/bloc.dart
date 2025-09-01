import 'dart:developer';
import 'package:bus/app/domain/usecases/products/get_product.dart';
import 'package:bus/app/domain/usecases/products/search_product.dart';
import 'package:bus/app/presentation/search/event.dart';
import 'package:bus/app/presentation/search/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;
  final GetSearchProducts getSearchProducts;

  ProductsBloc({required this.getProducts,required this.getSearchProducts})
    : super(ProductsInitial()) {
    on<FetchProductsEvent>(_onLoadProducts);
    on<FetchProductsByCategoryEvent>(_onFetchProductsByCategory);
    on<SearchProductEvent>(searchProduct);
  }

  Future<void> searchProduct(
    SearchProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await getSearchProducts(event.query);
      emit(ProductsLoaded(products));
    } catch (e, s) {
      log('FetchProductsSearchEvent error: $e', stackTrace: s);
      emit(ProductsError('Ürünler yüklenemedi.'));
    }
  }

  Future<void> _onLoadProducts(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await getProducts();
      emit(ProductsLoaded(products));
    } catch (e, s) {
      log('FetchProductsEvent error: $e', stackTrace: s);
      emit(ProductsError('Ürünler yüklenemedi.'));
    }
  }

  Future<void> _onFetchProductsByCategory(
    FetchProductsByCategoryEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await getProducts(categoryId: event.categoryId);
      emit(ProductsLoaded(products));
    } catch (e, s) {
      log('FetchProductsByCategoryEvent error: $e', stackTrace: s);
      emit(ProductsError('Kategoriye göre ürünler yüklenemedi.'));
    }
  }
}
