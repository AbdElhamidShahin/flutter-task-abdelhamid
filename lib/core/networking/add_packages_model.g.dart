// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_packages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPackagesModel _$AddPackagesModelFromJson(Map<String, dynamic> json) =>
    AddPackagesModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['price'] as String,
      json['currency'] as String,
      (json['duration'] as num).toInt(),
      (json['features'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddPackagesModelToJson(AddPackagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'duration': instance.duration,
      'features': instance.features,
    };
