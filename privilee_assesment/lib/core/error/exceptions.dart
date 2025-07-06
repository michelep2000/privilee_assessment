import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  ServerException({required this.message, required this.statusCode})
    : assert(
        statusCode is String || statusCode is int,
        'Status code cannot be a: ${statusCode.runtimeType}',
      );

  final String message;
  final dynamic statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class NoDataException extends Equatable implements Exception {
  final String message;
  const NoDataException(this.message);

  @override
  List<Object?> get props => [message];
}

class DataLoadException extends Equatable implements Exception {
  final String message;
  const DataLoadException(this.message);

  @override
  List<Object?> get props => [message];
}

class DartException extends Equatable implements Exception {
  const DartException(this.stackTrace);

  final StackTrace stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
