import 'package:dartz/dartz.dart';
import 'package:privilee_assesment/core/error/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
