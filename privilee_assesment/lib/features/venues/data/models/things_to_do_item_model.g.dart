// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'things_to_do_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThingsToDoItemModel _$ThingsToDoItemModelFromJson(Map<String, dynamic> json) =>
    ThingsToDoItemModel(
      image: _$JsonConverterFromJson<Map<String, dynamic>, ImageEntity>(
        json['image'],
        const ImageConverter().fromJson,
      ),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ThingsToDoItemModelToJson(
  ThingsToDoItemModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'image': _$JsonConverterToJson<Map<String, dynamic>, ImageEntity>(
    instance.image,
    const ImageConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
