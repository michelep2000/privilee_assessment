import 'package:dartz/dartz.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import '../../../../core/error/failures.dart';

abstract class VenueRepository {
  Future<Either<Failure, VenueEntity>> getVenues();
}
