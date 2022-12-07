// Package imports:
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String name;
  final int price;
  final int quantity;

  const Order({
    required this.name,
    required this.price,
    required this.quantity,
  });

  Order copyWith({
    String? name,
    int? price,
    int? quantity,
  }) {
    return Order(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        name,
        price,
        quantity,
      ];
}
