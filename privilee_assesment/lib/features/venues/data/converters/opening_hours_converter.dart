import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/opening_hours_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class OpeningHoursConverter
    implements JsonConverter<OpeningHoursEntity, Map<String, dynamic>> {
  const OpeningHoursConverter();

  @override
  OpeningHoursEntity fromJson(Map<String, dynamic> json) {
    return OpeningHoursModel();
  }

  @override
  Map<String, dynamic> toJson(OpeningHoursEntity object) {
    return {};
  }
}
