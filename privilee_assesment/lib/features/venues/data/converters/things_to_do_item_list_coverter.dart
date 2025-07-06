import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/things_to_do_item_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';

class ThingsToDoItemListConverter
    implements JsonConverter<List<ThingsToDoItemEntity>, List<dynamic>> {
  const ThingsToDoItemListConverter();

  @override
  List<ThingsToDoItemEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => ThingsToDoItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<ThingsToDoItemEntity> object) {
    return object.map((e) => (e as ThingsToDoItemModel).toJson()).toList();
  }
}
