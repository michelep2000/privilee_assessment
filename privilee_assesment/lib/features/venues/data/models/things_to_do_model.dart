import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/things_to_do_item_list_coverter.dart';
import 'package:privilee_assesment/features/venues/data/models/overview_text_model.dart';
import 'package:privilee_assesment/features/venues/data/models/things_to_do_item_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';

part 'things_to_do_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ThingsToDoModel extends ThingsToDoEntity {
  const ThingsToDoModel({
    required super.title,
    super.badge,
    List<List<OverviewTextModel>>? content,
    List<ThingsToDoItemModel>? items,
    super.subtitle,
  }) : super(content: content, items: items);

  factory ThingsToDoModel.fromJson(Map<String, dynamic> json) =>
      _$ThingsToDoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThingsToDoModelToJson(this);

  factory ThingsToDoModel.fromEntity(ThingsToDoEntity entity) {
    return ThingsToDoModel(
      title: entity.title,
      subtitle: entity.subtitle,
      badge: entity.badge,
    );
  }

  @override
  @_NestedOverviewTextListConverter()
  List<List<OverviewTextEntity>>? get content => super.content;

  @override
  @ThingsToDoItemListConverter()
  List<ThingsToDoItemEntity>? get items => super.items;
}

class _NestedOverviewTextListConverter
    implements JsonConverter<List<List<OverviewTextEntity>>, List<dynamic>> {
  const _NestedOverviewTextListConverter();

  @override
  List<List<OverviewTextEntity>> fromJson(List<dynamic> json) {
    return json.map((outerList) {
      if (outerList is List) {
        return outerList
            .map(
              (innerItem) =>
                  OverviewTextModel.fromJson(innerItem as Map<String, dynamic>),
            )
            .toList();
      }
      return <OverviewTextEntity>[];
    }).toList();
  }

  @override
  List<List<Map<String, dynamic>>> toJson(
    List<List<OverviewTextEntity>> object,
  ) {
    return object.map((outerList) {
      return outerList
          .map((innerItem) => (innerItem as OverviewTextModel).toJson())
          .toList();
    }).toList();
  }
}
