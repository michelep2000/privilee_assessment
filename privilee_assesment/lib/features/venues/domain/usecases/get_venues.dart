import 'package:privilee_assesment/core/usecases/usecase.dart';
import 'package:privilee_assesment/core/utils/typedef.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import 'package:privilee_assesment/features/venues/domain/repositories/venues_repository.dart';

class GetVenues extends UsecaseWithoutParams<VenueEntity> {
  GetVenues(this._repository);

  final VenueRepository _repository;

  @override
  ResultFuture<VenueEntity> call() => _repository.getVenues();
}
