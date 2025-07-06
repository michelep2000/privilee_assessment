import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';

class ItemCategoryEntity extends Equatable {
  const ItemCategoryEntity({
    required this.id,
    required this.category,
    this.title,
    this.detail,
    required this.showOnVenuePage,
  });

  final String id;
  final String category;
  final String? title;
  final List<OverviewTextEntity>? detail;
  final bool showOnVenuePage;

  @override
  List<Object?> get props => [id, category, title, detail, showOnVenuePage];
}
