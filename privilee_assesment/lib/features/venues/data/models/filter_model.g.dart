// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
  name: json['name'] as String?,
  type: json['type'] as String?,
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => FilterCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FilterModelToJson(
  FilterModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'categories': const FilterCategoryListConverter().toJson(instance.categories),
};
