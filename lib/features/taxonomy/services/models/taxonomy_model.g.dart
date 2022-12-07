// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyModel _$TaxonomyModelFromJson(Map<String, dynamic> json) =>
    TaxonomyModel(
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TaxonomyModelToJson(TaxonomyModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
