import 'package:bus/app/domain/entities/order_items_entity.dart';

class OrderItemModel extends OrderItemsEntity {
  OrderItemModel({
    required super.id,
    required super.orderId,
    required super.quantity,
    required super.productId,
    required super.priceAtTime,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> map) => OrderItemModel(
    id: map['id'],
    orderId: map['order_id'],
    productId: map['product_id'],
    quantity: map['quantity'],
    priceAtTime: int.parse(map['price_at_time'].toString()),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'order_id': orderId,
    'product_id': productId,
    'quantity': quantity,
    'price_at_time': priceAtTime,
  };

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json["id"] as String,
      orderId: json["order_id"] as String,
      productId: json["product_id"],
      quantity: int.parse(json["quantity"].toString()),
      priceAtTime: int.parse(json["price_at_time"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    "orderId": orderId,
    "quantity": quantity,
    "productId": productId,
    "priceAtTime": priceAtTime,
  };

  OrderItemsEntity toEntity() {
    return OrderItemsEntity(
      id: id, 
      orderId: orderId, 
      productId: productId, 
      priceAtTime: priceAtTime, 
      quantity: quantity,
      
    );
  }

  static OrderItemModel fromEntity(OrderItemsEntity order) {
    return OrderItemModel(
      id: order.id, 
      orderId: order.orderId, 
      quantity: order.quantity, 
      productId: order.productId, 
      priceAtTime: order.priceAtTime,
    );
  }
}
