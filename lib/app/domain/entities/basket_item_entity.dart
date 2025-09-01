class BasketItemEntity {
  final String orderId;
  final String orderItemId;
  final String name;
  final String imageUrl;
  final double price;
  final double priceAtTime;
  final int quantity;

  const BasketItemEntity( {
    required this.orderId,
    required this.orderItemId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.priceAtTime, 
    required this.quantity,
  });
}
