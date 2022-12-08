// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantModel _$VariantModelFromJson(Map<String, dynamic> json) {
  return VariantModel(
    createdAt: DateTime.parse(json['created_at'] as String),
    id: json['id'] as int,
    media: json['product']['media'][0]['conversions']['thumb'] as String,
    priceModel: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
    title: json['title'] as String,
    updatedAt: DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$VariantModelToJson(VariantModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'media': instance.media,
      'title': instance.title,
      'updated_at': instance.updatedAt.toIso8601String(),
      'price': instance.priceModel.toJson(),
    };
