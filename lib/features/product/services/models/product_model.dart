// Dart imports:

// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/services/models/variant_model.dart';

// Project imports:
part 'product_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class ProductModel extends Product {
  @JsonKey(name: 'variants')
  final List<VariantModel> variantsModel;

  const ProductModel({required String title, required this.variantsModel})
      : super(title: title, variants: variantsModel);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      title: product.title,
      variantsModel: product.variants.map(VariantModel.fromEntity).toList(),
    );
  }
}
