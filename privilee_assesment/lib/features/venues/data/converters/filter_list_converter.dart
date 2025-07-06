import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';

class FilterListConverter
    implements JsonConverter<List<FilterEntity>, List<dynamic>> {
  const FilterListConverter();

  @override
  List<FilterEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => FilterModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<FilterEntity> object) {
    return object.map((e) => (e as FilterModel).toJson()).toList();
  }
}
