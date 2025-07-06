import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

class ThingsToDoEntity extends Equatable {
  const ThingsToDoEntity({
    required this.title,
    this.badge,
    this.content,
    this.items,
    this.subtitle,
  });

  final String title;
  final String? badge;
  final List<List<OverviewTextEntity>>? content;
  final List<ThingsToDoItemEntity>? items;
  final String? subtitle;

  @override
  List<Object?> get props => [title, badge, content, items, subtitle];
}

class ThingsToDoItemEntity extends Equatable {
  const ThingsToDoItemEntity({this.image, required this.title});

  final ImageEntity? image;
  final String title;

  @override
  List<Object?> get props => [image, title];
}
