import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/filter_category_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_category_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';

part 'filter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilterModel extends FilterEntity {
  const FilterModel({
    required super.name,
    required super.type,
    required List<FilterCategoryModel> categories,
  }) : super(categories: categories);

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);

  factory FilterModel.fromEntity(FilterEntity entity) {
    return FilterModel(
      name: entity.name,
      type: entity.type,
      categories:
          entity.categories
              .map((e) => FilterCategoryModel.fromEntity(e))
              .toList(),
    );
  }

  @override
  @FilterCategoryListConverter()
  List<FilterCategoryEntity> get categories => super.categories;
}
