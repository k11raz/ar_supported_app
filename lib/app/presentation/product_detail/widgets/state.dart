import 'package:equatable/equatable.dart';
import '../../../app.dart';

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

class CardLoaded extends CardState {
  final List<BasketItemEntity> orders;
  final int totalItems;
  final double totalAmount;

  CardLoaded({required this.orders})
      : totalItems = orders.fold(0, (sum, i) => sum + i.quantity),
        totalAmount = orders.fold(0.0, (sum, i) => sum + (i.priceAtTime * i.quantity));

  @override
  List<Object> get props => [orders, totalItems, totalAmount];

  CardLoaded copyWith({required List<BasketItemEntity> orders}) {
    return CardLoaded(
      orders: orders,
    );
  }
}

class CardFailure extends CardState {
  final String message;

  const CardFailure(this.message);

  @override
  List<Object> get props => [message];
}
