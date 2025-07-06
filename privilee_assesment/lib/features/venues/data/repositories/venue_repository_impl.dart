import 'package:dartz/dartz.dart';
import 'package:privilee_assesment/core/error/exceptions.dart';
import 'package:privilee_assesment/core/error/failures.dart';
import 'package:privilee_assesment/features/venues/data/datasources/venues_remote_datasource.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import 'package:privilee_assesment/features/venues/domain/repositories/venues_repository.dart';

class VenueRepositoryImpl implements VenueRepository {
  final VenueRemoteDatasource remoteDatasource;

  VenueRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, VenueEntity>> getVenues() async {
    try {
      final VenueModel venueData = await remoteDatasource.getVenues();
      return Right(venueData);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on DataLoadException catch (e) {
      return Left(DataLoadFailure(message: e.message));
    }
  }

}
