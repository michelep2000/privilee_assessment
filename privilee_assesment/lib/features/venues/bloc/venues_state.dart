part of 'venues_bloc.dart';

sealed class VenuesState extends Equatable {
  const VenuesState();

  @override
  List<Object> get props => [];
}

final class VenuesInitial extends VenuesState {}

class GetVenuesSuccessState extends VenuesState {
  const GetVenuesSuccessState({required this.venueModel});

  final VenueModel venueModel;

  @override
  List<Object> get props => [venueModel];
}

class VenueErrorState extends VenuesState {
  const VenueErrorState({required this.message});

  final String message;

  @override
  List<String> get props => [message];
}
