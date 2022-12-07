// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonModel _$TaxonModelFromJson(Map<String, dynamic> json) => TaxonModel(
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      taxonomyModel:
          TaxonomyModel.fromJson(json['taxonomy'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TaxonModelToJson(TaxonModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'updated_at': instance.updatedAt.toIso8601String(),
      'taxonomy': instance.taxonomyModel.toJson(),
    };
