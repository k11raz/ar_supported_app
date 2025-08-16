abstract class CardEvent {}

class AddProductToCardEvent extends CardEvent {
  final String userId;
  final String productId;
  final int quantity;

  AddProductToCardEvent({
    required this.userId,
    required this.productId,
    this.quantity = 1,
  });
}