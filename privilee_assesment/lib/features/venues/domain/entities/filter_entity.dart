import 'package:equatable/equatable.dart';

class FilterEntity extends Equatable {
  const FilterEntity({
    required this.name,
    required this.type,
    required this.categories,
  });

  final String? name;
  final String? type;
  final List<FilterCategoryEntity> categories;

  @override
  List<Object?> get props => [name, type, categories];
}

class FilterCategoryEntity extends Equatable {
  const FilterCategoryEntity({required this.id, required this.name});
  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
