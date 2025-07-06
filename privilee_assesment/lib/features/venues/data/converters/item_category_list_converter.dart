import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/item_category_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/item_category_entity.dart';

class ItemCategoryListConverter
    implements JsonConverter<List<ItemCategoryEntity>, List<dynamic>> {
  const ItemCategoryListConverter();

  @override
  List<ItemCategoryEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => ItemCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<ItemCategoryEntity> object) {
    return object.map((e) => (e as ItemCategoryModel).toJson()).toList();
  }
}
