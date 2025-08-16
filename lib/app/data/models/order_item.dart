import 'package:bus/app/domain/entities/order_items.dart';

class OrderItemModel extends OrderItemsEntity {
  OrderItemModel({
  required super.id, 
  required super.order_id, 
  required super.product_id, 
  required super.quantity, 
  required super.price_at_time});

  factory OrderItemModel.fromMap(Map<String, dynamic> map) => OrderItemModel(
    id: map['id'],
    order_id: map['order_id'],
    product_id: map['product_id'],
    quantity: map['quantity'],
    price_at_time: int.parse(map['price_at_time'].toString()),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'order_id': order_id,
    'product_id': product_id,
    'quantity': quantity,
    'price_at_time': price_at_time,
  };
}
