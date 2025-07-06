import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';

part 'filter_category_model.g.dart';

@JsonSerializable()
class FilterCategoryModel extends FilterCategoryEntity {
  const FilterCategoryModel({required super.id, required super.name});

  factory FilterCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FilterCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterCategoryModelToJson(this);

  factory FilterCategoryModel.fromEntity(FilterCategoryEntity entity) {
    return FilterCategoryModel(id: entity.id, name: entity.name);
  }
}
