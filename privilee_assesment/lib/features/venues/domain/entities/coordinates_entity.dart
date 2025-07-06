import 'package:equatable/equatable.dart';

class CoordinatesEntity extends Equatable {
  const CoordinatesEntity({required this.lat, required this.lng});

  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [lat, lng];
}
