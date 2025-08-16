class OrderItemsEntity {
  final String id;
  final String order_id;
  final String product_id;
  final int quantity;
  final int price_at_time;

  OrderItemsEntity({
    required this.id,
    required this.order_id,
    required this.product_id,
    required this.quantity,
    required this.price_at_time,
  });
}
