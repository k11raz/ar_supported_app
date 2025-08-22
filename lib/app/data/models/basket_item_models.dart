import 'package:bus/app/domain/entities/basket_item.dart';
import 'package:bus/app/domain/entities/product.dart';

class BasketItemModel {
  final String orderId;
  final String orderItemId;
  final String name;
  final String imageUrl;
  final double price;

  BasketItemModel({
    required this.orderId,
    required this.orderItemId,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      orderId: json['order_id'],
      orderItemId: json['order_items_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      price: double.parse(json['price'].toString()),
    );
  }

  BasketItemEntity toEntity() {
    return BasketItemEntity(
      orderId: orderId, 
      orderItemId: orderItemId, 
      name: name, 
      imageUrl: imageUrl, 
      price: price
      
    );
  }
}
