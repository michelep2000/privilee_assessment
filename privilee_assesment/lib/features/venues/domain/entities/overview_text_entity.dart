import 'package:equatable/equatable.dart';

class OverviewTextEntity extends Equatable {
  const OverviewTextEntity({required this.text});
  final String text;

  @override
  List<Object?> get props => [text];
}
