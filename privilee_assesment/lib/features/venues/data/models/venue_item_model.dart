import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/coordinates_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/image_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/item_category_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/opening_hours_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/overview_text_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/things_to_do_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/models/coordinates_model.dart';
import 'package:privilee_assesment/features/venues/data/models/image_model.dart';
import 'package:privilee_assesment/features/venues/data/models/item_category_model.dart';
import 'package:privilee_assesment/features/venues/data/models/opening_hours_model.dart';
import 'package:privilee_assesment/features/venues/data/models/overview_text_model.dart';
import 'package:privilee_assesment/features/venues/data/models/things_to_do_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/item_category_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

part 'venue_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VenueItemModel extends VenueItemEntity {
  const VenueItemModel({
    required super.section,
    required super.name,
    required super.city,
    required super.type,
    required CoordinatesModel coordinates,
    required super.location,
    required List<ImageModel> images,
    required List<ItemCategoryModel> categories,
    required OpeningHoursModel openingHours,
    required super.accessibleForGuestPass,
    required List<OverviewTextModel> overviewText,
    required List<ThingsToDoModel> thingsToDo,
  }) : super(
         coordinates: coordinates,
         images: images,
         categories: categories,
         openingHours: openingHours,
         overviewText: overviewText,
         thingsToDo: thingsToDo,
       );

  factory VenueItemModel.fromJson(Map<String, dynamic> json) =>
      _$VenueItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$VenueItemModelToJson(this);

  factory VenueItemModel.fromEntity(VenueItemEntity entity) {
    return VenueItemModel(
      section: entity.section,
      name: entity.name,
      city: entity.city,
      type: entity.type,
      coordinates: CoordinatesModel.fromEntity(entity.coordinates),
      location: entity.location,
      images: entity.images.map((e) => ImageModel.fromEntity(e)).toList(),
      categories:
          entity.categories
              .map((e) => ItemCategoryModel.fromEntity(e))
              .toList(),
      openingHours: OpeningHoursModel.fromEntity(entity.openingHours),
      accessibleForGuestPass: entity.accessibleForGuestPass,
      overviewText:
          entity.overviewText
              .map((e) => OverviewTextModel.fromEntity(e))
              .toList(),
      thingsToDo:
          entity.thingsToDo.map((e) => ThingsToDoModel.fromEntity(e)).toList(),
    );
  }

  @override
  @CoordinatesConverter()
  CoordinatesEntity get coordinates => super.coordinates;

  @override
  @OpeningHoursConverter()
  OpeningHoursEntity get openingHours => super.openingHours;

  @override
  @ImageListConverter()
  List<ImageEntity> get images => super.images;

  @override
  @ItemCategoryListConverter()
  List<ItemCategoryEntity> get categories => super.categories;

  @override
  @OverviewTextListConverter()
  List<OverviewTextEntity> get overviewText => super.overviewText;

  @override
  @ThingsToDoListConverter()
  List<ThingsToDoEntity> get thingsToDo => super.thingsToDo;
}
