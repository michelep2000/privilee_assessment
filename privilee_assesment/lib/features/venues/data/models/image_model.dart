import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends ImageEntity {
  const ImageModel({super.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  factory ImageModel.fromEntity(ImageEntity entity) {
    return ImageModel(url: entity.url);
  }
}
