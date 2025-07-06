import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/core/error/exceptions.dart';

class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
    : assert(
        statusCode is String || statusCode is int,
        'Status code cannot be a: ${statusCode.runtimeType}',
      );

  final String message;
  final dynamic statusCode;

  String get errorMessage => '$statusCode ERROR: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.statusCode = 500});

  ServerFailure.fromException(ServerException exception)
    : this(message: exception.message, statusCode: exception.statusCode);
}

class DataLoadFailure extends Failure {
  DataLoadFailure({required super.message, super.statusCode = 503});

  DataLoadFailure.fromException(ServerException exception)
    : this(message: exception.message, statusCode: exception.statusCode);
}

class NoDataFailure extends Failure {
  NoDataFailure({required super.message, super.statusCode = 403});

  NoDataFailure.fromException(ServerException exception)
    : this(message: exception.message, statusCode: exception.statusCode);
}
