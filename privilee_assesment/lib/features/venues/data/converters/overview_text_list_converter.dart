import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/data/models/overview_text_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';

class OverviewTextListConverter
    implements JsonConverter<List<OverviewTextEntity>, List<dynamic>> {
  const OverviewTextListConverter();

  @override
  List<OverviewTextEntity> fromJson(List<dynamic> json) {
    return json
        .map((e) => OverviewTextModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<OverviewTextEntity> object) {
    return object.map((e) => (e as OverviewTextModel).toJson()).toList();
  }
}
