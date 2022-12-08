// Dart imports:

// Package imports:
import 'package:cart_demo/features/order/domain/entity/order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:

part 'order_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class OrderModel extends Order {
  const OrderModel({
    required String name,
    required int price,
    required int quantity,
  }) : super(name: name, price: price, quantity: quantity);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromEntity(Order order) {
    return OrderModel(
      name: order.name,
      price: order.price,
      quantity: order.quantity,
    );
  }
}
