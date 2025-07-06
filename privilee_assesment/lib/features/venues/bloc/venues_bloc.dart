import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_model.dart';
import 'package:privilee_assesment/features/venues/domain/usecases/get_venues.dart';

part 'venues_event.dart';
part 'venues_state.dart';

class VenuesBloc extends Bloc<VenuesEvent, VenuesState> {
  VenuesBloc({required GetVenues getVenues})
    : _getVenues = getVenues,
      super(VenuesInitial()) {
    on<GetVenuesEvent>(_getVenuesHandler);
  }

  final GetVenues _getVenues;

  FutureOr<void> _getVenuesHandler(
    GetVenuesEvent event,
    Emitter<VenuesState> emit,
  ) async {
    final result = await _getVenues();

    result.fold(
      (failure) => emit(VenueErrorState(message: failure.errorMessage)),
      (venue) =>
          emit(GetVenuesSuccessState(venueModel: VenueModel.fromEntity(venue))),
    );
  }
}
