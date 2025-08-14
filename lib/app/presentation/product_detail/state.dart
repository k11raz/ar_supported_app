import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  final bool hideBottomSheet;

  const ProductDetailState({this.hideBottomSheet = false});

  ProductDetailState copyWith({bool? hideBottomSheet}) {
    return ProductDetailState(
      hideBottomSheet: hideBottomSheet ?? this.hideBottomSheet,
    );
  }

  @override
  List<Object?> get props => [hideBottomSheet];
}
