// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'taxonomy_api_param.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class TaxonomyApiParam extends Equatable {
  const TaxonomyApiParam({required this.taxonomy});
  final String taxonomy;

  Map<String, dynamic> toJson() => _$TaxonomyApiParamToJson(this);
  @override
  List<Object?> get props => [taxonomy];
}
