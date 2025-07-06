import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/filter_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/converters/venue_item_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_model.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_item_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

part 'venue_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VenueModel extends VenueEntity {
  const VenueModel({
    required List<FilterModel> filters,
    required List<VenueItemModel> items,
    required super.cities,
  }) : super(filters: filters, items: items);

  factory VenueModel.fromJson(Map<String, dynamic> json) =>
      _$VenueModelFromJson(json);

  Map<String, dynamic> toJson() => _$VenueModelToJson(this);

  factory VenueModel.fromEntity(VenueEntity entity) {
    return VenueModel(
      filters: entity.filters.map((e) => FilterModel.fromEntity(e)).toList(),
      items: entity.items.map((e) => VenueItemModel.fromEntity(e)).toList(),
      cities: entity.cities,
    );
  }

  @override
  @FilterListConverter()
  List<FilterEntity> get filters => super.filters;

  @override
  @VenueItemListConverter()
  List<VenueItemEntity> get items => super.items;
}
