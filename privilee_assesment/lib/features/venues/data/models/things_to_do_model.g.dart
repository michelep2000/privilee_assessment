// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'things_to_do_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThingsToDoModel _$ThingsToDoModelFromJson(
  Map<String, dynamic> json,
) => ThingsToDoModel(
  title: json['title'] as String,
  badge: json['badge'] as String?,
  content:
      (json['content'] as List<dynamic>?)
          ?.map(
            (e) =>
                (e as List<dynamic>)
                    .map(
                      (e) =>
                          OverviewTextModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          )
          .toList(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ThingsToDoItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  subtitle: json['subtitle'] as String?,
);

Map<String, dynamic> _$ThingsToDoModelToJson(ThingsToDoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'badge': instance.badge,
      'subtitle': instance.subtitle,
      'content':
          _$JsonConverterToJson<List<dynamic>, List<List<OverviewTextEntity>>>(
            instance.content,
            const _NestedOverviewTextListConverter().toJson,
          ),
      'items': _$JsonConverterToJson<List<dynamic>, List<ThingsToDoItemEntity>>(
        instance.items,
        const ThingsToDoItemListConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
