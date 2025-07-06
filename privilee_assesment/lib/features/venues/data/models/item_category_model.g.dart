// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCategoryModel _$ItemCategoryModelFromJson(Map<String, dynamic> json) =>
    ItemCategoryModel(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String?,
      detail:
          (json['detail'] as List<dynamic>?)
              ?.map(
                (e) => OverviewTextModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      showOnVenuePage: json['showOnVenuePage'] as bool,
    );

Map<String, dynamic> _$ItemCategoryModelToJson(ItemCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'showOnVenuePage': instance.showOnVenuePage,
      'detail': _$JsonConverterToJson<List<dynamic>, List<OverviewTextEntity>>(
        instance.detail,
        const OverviewTextListConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
