import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';

part 'coordinates_model.g.dart';

@JsonSerializable()
class CoordinatesModel extends CoordinatesEntity {
  const CoordinatesModel({required super.lat, required super.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);

  factory CoordinatesModel.fromEntity(CoordinatesEntity entity) {
    return CoordinatesModel(lat: entity.lat, lng: entity.lng);
  }
}
