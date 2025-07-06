import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class VenueEntity extends Equatable {
  const VenueEntity({
    required this.filters,
    required this.items,
    required this.cities,
  });

  final List<FilterEntity> filters;
  final List<VenueItemEntity> items;
  final List<String> cities;

  @override
  List<Object?> get props => [filters, items, cities];
}
