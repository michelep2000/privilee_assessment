part of 'venues_bloc.dart';

sealed class VenuesEvent extends Equatable {
  const VenuesEvent();

  @override
  List<Object> get props => [];
}

class GetVenuesEvent extends VenuesEvent {
  const GetVenuesEvent();
}
