import 'package:bus/app/presentation/product_detail/event.dart';
import 'package:bus/app/presentation/product_detail/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<ProductDetailScrollChanged>(_onScrollChanged);
  }

  void _onScrollChanged(
      ProductDetailScrollChanged event, Emitter<ProductDetailState> emit) {
    final shouldHide = event.offset >= event.totalImagesHeight - 50;

    if (shouldHide != state.hideBottomSheet) {
      emit(state.copyWith(hideBottomSheet: shouldHide));
    }
  }
}
