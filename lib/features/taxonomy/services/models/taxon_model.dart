// Dart imports:

// Package imports:
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:cart_demo/features/taxonomy/services/models/taxonomy_model.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'taxon_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class TaxonModel extends Taxon {
  @JsonKey(name: 'taxonomy')
  final TaxonomyModel taxonomyModel;

  const TaxonModel({
    required DateTime createdAt,
    required int id,
    required String name,
    required String slug,
    required this.taxonomyModel,
    required DateTime updatedAt,
  }) : super(
          createdAt: createdAt,
          id: id,
          name: name,
          slug: slug,
          taxonomy: taxonomyModel,
          updatedAt: updatedAt,
        );

  factory TaxonModel.fromJson(Map<String, dynamic> json) =>
      _$TaxonModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxonModelToJson(this);

  factory TaxonModel.fromEntity(Taxon taxon) {
    return TaxonModel(
      createdAt: taxon.createdAt,
      id: taxon.id,
      name: taxon.name,
      slug: taxon.slug,
      taxonomyModel: TaxonomyModel.fromEntity(taxon.taxonomy),
      updatedAt: taxon.updatedAt,
    );
  }
}
