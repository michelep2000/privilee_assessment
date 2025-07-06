import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_item_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class VenueItemListConverter implements JsonConverter<List<VenueItemEntity>, List<dynamic>> {
  const VenueItemListConverter();

  @override
  List<VenueItemEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => VenueItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<VenueItemEntity> object) {
    return object.map((e) => (e as VenueItemModel).toJson()).toList();
  }
}
