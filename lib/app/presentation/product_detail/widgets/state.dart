import 'package:bus/app/domain/entities/basket_item.dart';
import 'package:bus/app/domain/entities/order_items.dart';
import 'package:equatable/equatable.dart';

abstract class CardState extends Equatable {
  const CardState();
}

class CardInitial extends CardState {
  @override
  List<Object> get props => [];
}

class CardLoading extends CardState {
  @override
  List<Object> get props => [];
}

class CardSuccess extends CardState {
  final List<OrderItemsEntity> items;
  final int totalItems;
  final double totalAmount;

  CardSuccess({this.items = const []})
      : totalItems = items.fold(0, (sum, i) => sum + i.quantity),
        totalAmount =
            items.fold(0, (sum, i) => sum + (i.priceAtTime * i.quantity));

  @override
  List<Object?> get props => [items, totalItems, totalAmount];
}

class CardLoaded extends CardState {
  final List<BasketItemEntity> orders;
  const CardLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class CardFailure extends CardState {
  final String message;

  const CardFailure(this.message);

  @override
  List<Object> get props => [message];
}
