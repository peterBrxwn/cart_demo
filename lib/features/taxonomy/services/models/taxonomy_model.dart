// Dart imports:

// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:cart_demo/features/taxonomy/domain/entity/taxonomy_entity.dart';

// Project imports:
part 'taxonomy_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class TaxonomyModel extends Taxonomy {
  const TaxonomyModel({
    required DateTime createdAt,
    required int id,
    required String name,
    required String slug,
    required DateTime updatedAt,
  }) : super(
          createdAt: createdAt,
          id: id,
          name: name,
          slug: slug,
          updatedAt: updatedAt,
        );

  factory TaxonomyModel.fromJson(Map<String, dynamic> json) =>
      _$TaxonomyModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxonomyModelToJson(this);

  factory TaxonomyModel.fromEntity(Taxonomy taxonomy) {
    return TaxonomyModel(
      createdAt: taxonomy.createdAt,
      id: taxonomy.id,
      name: taxonomy.name,
      slug: taxonomy.slug,
      updatedAt: taxonomy.updatedAt,
    );
  }
}
