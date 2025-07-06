import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/image_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class ImageListConverter
    implements JsonConverter<List<ImageEntity>, List<dynamic>> {
  const ImageListConverter();

  @override
  List<ImageEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<ImageEntity> object) {
    return object.map((e) => (e as ImageModel).toJson()).toList();
  }
}
