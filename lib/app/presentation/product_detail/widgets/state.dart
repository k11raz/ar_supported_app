abstract class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardSuccess extends CardState {
  final int totalItems;
  final double totalAmount;

  CardSuccess({required this.totalItems, required this.totalAmount});
}

class CardFailure extends CardState {
  final String message;

  CardFailure(this.message);
}
