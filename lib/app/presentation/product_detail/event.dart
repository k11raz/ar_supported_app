import 'package:equatable/equatable.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class ProductDetailScrollChanged extends ProductDetailEvent {
  final double offset;
  final double totalImagesHeight;

  const ProductDetailScrollChanged(this.offset, this.totalImagesHeight);

  @override
  List<Object?> get props => [offset, totalImagesHeight];
}
