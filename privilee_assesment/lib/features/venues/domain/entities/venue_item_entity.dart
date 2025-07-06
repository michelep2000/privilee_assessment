import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/item_category_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';

enum SectionEntity { hotel }

class VenueItemEntity extends Equatable {
  const VenueItemEntity({
    required this.section,
    required this.name,
    required this.city,
    required this.type,
    required this.coordinates,
    required this.location,
    required this.images,
    required this.categories,
    required this.openingHours,
    required this.accessibleForGuestPass,
    required this.overviewText,
    required this.thingsToDo,
  });

  final SectionEntity section;
  final String name;
  final String city;
  final SectionEntity type;
  final CoordinatesEntity coordinates;
  final String location;
  final List<ImageEntity> images;
  final List<ItemCategoryEntity> categories;
  final OpeningHoursEntity openingHours;
  final bool accessibleForGuestPass;
  final List<OverviewTextEntity> overviewText;
  final List<ThingsToDoEntity> thingsToDo;

  @override
  List<Object?> get props => [
    section,
    name,
    city,
    type,
    coordinates,
    location,
    images,
    categories,
    openingHours,
    accessibleForGuestPass,
    overviewText,
    thingsToDo,
  ];
}

class OpeningHoursEntity extends Equatable {
  const OpeningHoursEntity();

  @override
  List<Object?> get props => [];
}

class ImageEntity extends Equatable {
  const ImageEntity({this.url});

  final String? url;

  @override
  List<Object?> get props => [url];
}
