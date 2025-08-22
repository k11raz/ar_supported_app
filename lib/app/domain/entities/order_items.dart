class OrderItemsEntity {
  final String id;
  final String orderId;
  final String productId;
  final int quantity;
  final int priceAtTime;

  OrderItemsEntity(  {
    required this.id,
    required this.orderId,
    required this.productId,
    required this.priceAtTime, 
    required this.quantity,
  });
}
