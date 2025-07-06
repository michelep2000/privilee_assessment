import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/coordinates_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';

class CoordinatesConverter
    implements JsonConverter<CoordinatesEntity, Map<String, dynamic>> {
  const CoordinatesConverter();

  @override
  CoordinatesEntity fromJson(Map<String, dynamic> json) {
    return CoordinatesModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CoordinatesEntity object) {
    return (object as CoordinatesModel).toJson();
  }
}
