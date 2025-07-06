import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/image_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class ImageConverter
    implements JsonConverter<ImageEntity, Map<String, dynamic>> {
  const ImageConverter();

  @override
  ImageEntity fromJson(Map<String, dynamic> json) {
    return ImageModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ImageEntity object) {
    return (object as ImageModel).toJson();
  }
}
