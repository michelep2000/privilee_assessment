import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/overview_text_list_converter.dart';
import 'package:privilee_assesment/features/venues/data/models/overview_text_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/item_category_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';

part 'item_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemCategoryModel extends ItemCategoryEntity {
  const ItemCategoryModel({
    required super.id,
    required super.category,
    super.title,
    List<OverviewTextModel>? detail,
    required super.showOnVenuePage,
  }) : super(detail: detail);

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCategoryModelToJson(this);

  factory ItemCategoryModel.fromEntity(ItemCategoryEntity entity) {
    return ItemCategoryModel(
      id: entity.id,
      category: entity.category,
      title: entity.title,
      detail:
          entity.detail?.map((e) => OverviewTextModel.fromEntity(e)).toList(),
      showOnVenuePage: entity.showOnVenuePage,
    );
  }

  @override
  @OverviewTextListConverter()
  List<OverviewTextEntity>? get detail => super.detail;
}
