// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueItemModel _$VenueItemModelFromJson(Map<String, dynamic> json) =>
    VenueItemModel(
      section: $enumDecode(_$SectionEntityEnumMap, json['section']),
      name: json['name'] as String,
      city: json['city'] as String,
      type: $enumDecode(_$SectionEntityEnumMap, json['type']),
      coordinates: CoordinatesModel.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
      location: json['location'] as String,
      images:
          (json['images'] as List<dynamic>)
              .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      categories:
          (json['categories'] as List<dynamic>)
              .map((e) => ItemCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      openingHours: OpeningHoursModel.fromJson(
        json['openingHours'] as Map<String, dynamic>,
      ),
      accessibleForGuestPass: json['accessibleForGuestPass'] as bool,
      overviewText:
          (json['overviewText'] as List<dynamic>)
              .map((e) => OverviewTextModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      thingsToDo:
          (json['thingsToDo'] as List<dynamic>)
              .map((e) => ThingsToDoModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$VenueItemModelToJson(
  VenueItemModel instance,
) => <String, dynamic>{
  'section': _$SectionEntityEnumMap[instance.section]!,
  'name': instance.name,
  'city': instance.city,
  'type': _$SectionEntityEnumMap[instance.type]!,
  'location': instance.location,
  'accessibleForGuestPass': instance.accessibleForGuestPass,
  'coordinates': const CoordinatesConverter().toJson(instance.coordinates),
  'openingHours': const OpeningHoursConverter().toJson(instance.openingHours),
  'images': const ImageListConverter().toJson(instance.images),
  'categories': const ItemCategoryListConverter().toJson(instance.categories),
  'overviewText': const OverviewTextListConverter().toJson(
    instance.overviewText,
  ),
  'thingsToDo': const ThingsToDoListConverter().toJson(instance.thingsToDo),
};

const _$SectionEntityEnumMap = {SectionEntity.hotel: 'hotel'};
