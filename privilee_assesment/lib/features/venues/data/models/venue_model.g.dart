// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueModel _$VenueModelFromJson(Map<String, dynamic> json) => VenueModel(
  filters:
      (json['filters'] as List<dynamic>)
          .map((e) => FilterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  items:
      (json['items'] as List<dynamic>)
          .map((e) => VenueItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  cities: (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$VenueModelToJson(VenueModel instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'filters': const FilterListConverter().toJson(instance.filters),
      'items': const VenueItemListConverter().toJson(instance.items),
    };
