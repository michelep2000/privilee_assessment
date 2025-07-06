import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_category_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';

class FilterCategoryListConverter
    implements JsonConverter<List<FilterCategoryEntity>, List<dynamic>> {
  const FilterCategoryListConverter();

  @override
  List<FilterCategoryEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => FilterCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<FilterCategoryEntity> object) {
    return object.map((e) => (e as FilterCategoryModel).toJson()).toList();
  }
}
