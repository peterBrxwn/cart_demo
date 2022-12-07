// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'product_api_param.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class ProductApiParam extends Equatable {
  const ProductApiParam({required this.taxons});
  @JsonKey(name: 'filter[taxons]')
  final String taxons;

  Map<String, dynamic> toJson() => _$ProductApiParamToJson(this);
  @override
  List<Object?> get props => [taxons];
}
