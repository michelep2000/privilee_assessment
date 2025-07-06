import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/converters/image_converter.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

part 'things_to_do_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ThingsToDoItemModel extends ThingsToDoItemEntity {
  const ThingsToDoItemModel({super.image, required super.title});

  factory ThingsToDoItemModel.fromJson(Map<String, dynamic> json) =>
      _$ThingsToDoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThingsToDoItemModelToJson(this);

  @override
  @ImageConverter()
  ImageEntity? get image => super.image;
}
