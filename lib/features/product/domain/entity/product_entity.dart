// Package imports:
import 'package:cart_demo/features/product/domain/entity/variant_entity.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final List<Variant> variants;

  const Product({required this.title, required this.variants});

  Product copyWith({String? title, List<Variant>? variants}) {
    return Product(
      title: title ?? this.title,
      variants: variants ?? this.variants,
    );
  }

  @override
  List<Object?> get props => [title, variants];
}
