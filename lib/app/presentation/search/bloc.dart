import 'dart:developer';

import 'package:bus/app/domain/entities/product.dart';
import 'package:bus/app/domain/usecases/products/get_product.dart';
import 'package:bus/app/presentation/search/event.dart';
import 'package:bus/app/presentation/search/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  ProductsBloc(this.getProducts) : super(ProductsInitial()) {
    on<FetchProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final List<ProductEntity> products = await getProducts();
      emit(ProductsLoaded(products));
      print(products);
    } catch (e) {
      emit(ProductsError('Ürünler yüklenemedi.'));
      log(e.toString());
    }
  }
}
