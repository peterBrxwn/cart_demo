// Dart imports:

// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:cart_demo/features/product/domain/entity/variant_entity.dart';
import 'package:cart_demo/features/product/services/models/price_model.dart';

// Project imports:
part 'variant_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class VariantModel extends Variant {
  @JsonKey(name: 'price')
  final PriceModel priceModel;

  const VariantModel({
    required DateTime createdAt,
    required int id,
    required String media,
    required this.priceModel,
    required String title,
    required DateTime updatedAt,
  }) : super(
          createdAt: createdAt,
          id: id,
          media: media,
          price: priceModel,
          title: title,
          updatedAt: updatedAt,
        );

  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);
  Map<String, dynamic> toJson() => _$VariantModelToJson(this);

  factory VariantModel.fromEntity(Variant variant) {
    return VariantModel(
      createdAt: variant.createdAt,
      id: variant.id,
      media: variant.media,
      priceModel: PriceModel.fromEntity(variant.price),
      title: variant.title,
      updatedAt: variant.updatedAt,
    );
  }
}
