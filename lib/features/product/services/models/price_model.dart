// Dart imports:

// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:cart_demo/features/product/domain/entity/price_entity.dart';

// Project imports:
part 'price_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class PriceModel extends Price {
  const PriceModel({
    required int amount,
    required String currency,
    required String formatted,
  }) : super(amount: amount, currency: currency, formatted: formatted);

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

  factory PriceModel.fromEntity(Price order) {
    return PriceModel(
      amount: order.amount,
      currency: order.currency,
      formatted: order.formatted,
    );
  }
}
