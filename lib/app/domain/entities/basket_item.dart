class BasketItemEntity {
  final String orderId;
  final String orderItemId;
  final String name;
  final String imageUrl;
  final double price;

  const BasketItemEntity({
    required this.orderId,
    required this.orderItemId,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}
