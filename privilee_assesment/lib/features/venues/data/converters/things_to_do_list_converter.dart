import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/things_to_do_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';

class ThingsToDoListConverter
    implements JsonConverter<List<ThingsToDoEntity>, List<dynamic>> {
  const ThingsToDoListConverter();

  @override
  List<ThingsToDoEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => ThingsToDoModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<ThingsToDoEntity> object) {
    return object.map((e) => (e as ThingsToDoModel).toJson()).toList();
  }
}
