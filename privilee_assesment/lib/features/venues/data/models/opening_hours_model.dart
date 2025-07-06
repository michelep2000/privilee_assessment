import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

part 'opening_hours_model.g.dart';

@JsonSerializable()
class OpeningHoursModel extends OpeningHoursEntity {
  const OpeningHoursModel() : super();

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursModelToJson(this);

  factory OpeningHoursModel.fromEntity(OpeningHoursEntity entity) {
    return OpeningHoursModel();
  }
}
