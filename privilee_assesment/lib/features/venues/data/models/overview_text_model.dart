import 'package:json_annotation/json_annotation.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';

part 'overview_text_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OverviewTextModel extends OverviewTextEntity {
  const OverviewTextModel({required super.text});

  factory OverviewTextModel.fromJson(Map<String, dynamic> json) =>
      _$OverviewTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewTextModelToJson(this);

  factory OverviewTextModel.fromEntity(OverviewTextEntity entity) {
    return OverviewTextModel(text: entity.text);
  }
}
