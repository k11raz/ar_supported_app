import 'package:equatable/equatable.dart';
import '../../../app.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object?> get props => [];
}

class AddProductToCardEvent extends CardEvent {
  
  final ProductEntity product;
  final int quantity;

  const AddProductToCardEvent({
    required this.product,
    this.quantity = 1,
  });

  @override
  List<Object?> get props => [ product, quantity];
}

class RemoveProductFromCardEvent extends CardEvent {
  final ProductEntity product;
  final int quantity;

  const RemoveProductFromCardEvent({
    required this.product,
    this.quantity = -1,
  });

   @override
  List<Object?> get props => [product, quantity];
}

class FetchOrderItemsEvent extends CardEvent {}
