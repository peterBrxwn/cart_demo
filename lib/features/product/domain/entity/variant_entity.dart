// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:cart_demo/features/product/domain/entity/price_entity.dart';

class Variant extends Equatable {
  final DateTime createdAt;
  final int id;
  final String media;
  final Price price;
  final String title;
  final DateTime updatedAt;

  const Variant({
    required this.createdAt,
    required this.id,
    required this.media,
    required this.price,
    required this.title,
    required this.updatedAt,
  });

  Variant copyWith({
    DateTime? createdAt,
    int? id,
    String? media,
    Price? price,
    String? title,
    DateTime? updatedAt,
  }) {
    return Variant(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      media: media ?? this.media,
      price: price ?? this.price,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [createdAt, id, media, price, title, updatedAt];
}
