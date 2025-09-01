import 'package:bus/app/domain/entities/basket_item_entity.dart';

class BasketItemModel {
  final String orderId;
  final String orderItemId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final double priceAtTime;

  BasketItemModel(  {
    required this.orderId,
    required this.orderItemId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.priceAtTime,
  });

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      orderId: json['order_id'],
      orderItemId: json['order_items_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      price: double.parse(json['price'].toString()),
      quantity: int.parse(json['quantity'].toString()),
      priceAtTime: double.parse(json['price_at_time'].toString()),
    );
  }

  BasketItemEntity toEntity() {
    return BasketItemEntity(
      orderId: orderId,
      orderItemId: orderItemId,
      name: name,
      imageUrl: imageUrl,
      price: price,
      priceAtTime: priceAtTime,
      quantity: quantity,
    );
  }
}
