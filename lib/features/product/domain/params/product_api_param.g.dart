// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ProductApiParamToJson(ProductApiParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stringify', instance.stringify);
  val['filter[taxons]'] = instance.taxons;
  return val;
}
