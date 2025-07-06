import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:privilee_assesment/core/error/failures.dart';
import 'package:privilee_assesment/features/venues/bloc/venues_bloc.dart';
import 'package:privilee_assesment/features/venues/data/models/coordinates_model.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_category_model.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_model.dart';
import 'package:privilee_assesment/features/venues/data/models/opening_hours_model.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_item_model.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';
import 'package:privilee_assesment/features/venues/domain/usecases/get_venues.dart';

import 'venues_bloc_test.mocks.dart';

@GenerateMocks([GetVenues])
void main() {
  late VenuesBloc venuesBloc;
  late MockGetVenues mockGetVenues;

  setUp(() {
    mockGetVenues = MockGetVenues();
    venuesBloc = VenuesBloc(getVenues: mockGetVenues);
  });

  tearDown(() {
    venuesBloc.close();
  });

  group('VenuesBloc', () {
    final tVenue = VenueEntity(
      filters: [
        FilterModel(
          name: 'Venue type',
          type: 'multi',
          categories: [
            FilterCategoryModel(id: 'Za41RRIAACMA22aW', name: 'Hotel'),
          ],
        ),
      ],
      items: [
        VenueItemEntity(
          section: SectionEntity.hotel,
          name: 'Test Hotel',
          city: 'Dubai',
          type: SectionEntity.hotel,
          coordinates: CoordinatesEntity(lat: 25.0, lng: 55.0),
          location: 'Test Location',
          images: [],
          categories: [],
          openingHours: OpeningHoursEntity(),
          accessibleForGuestPass: true,
          overviewText: [],
          thingsToDo: [],
        ),
      ],
      cities: ['Dubai', 'Abu Dhabi'],
    );

    final tVenueModel = VenueModel(
      filters: [
        FilterModel(
          name: 'Venue type',
          type: 'multi',
          categories: [
            FilterCategoryModel(id: 'Za41RRIAACMA22aW', name: 'Hotel'),
          ],
        ),
      ],
      items: [
        VenueItemModel(
          section: SectionEntity.hotel,
          name: 'Test Hotel',
          city: 'Dubai',
          type: SectionEntity.hotel,
          coordinates: CoordinatesModel(lat: 25.0, lng: 55.0),
          location: 'Test Location',
          images: [],
          categories: [],
          openingHours: OpeningHoursModel(),
          accessibleForGuestPass: true,
          overviewText: [],
          thingsToDo: [],
        ),
      ],
      cities: ['Dubai', 'Abu Dhabi'],
    );

    const tErrorMessage = 'Failed to fetch venues';

    test('initial state is VenuesInitial', () {
      expect(venuesBloc.state, equals(VenuesInitial()));
    });

    blocTest<VenuesBloc, VenuesState>(
      'emits [GetVenuesSuccessState] when GetVenuesEvent is added and GetVenues returns success',
      build: () {
        when(mockGetVenues()).thenAnswer((_) async => Right(tVenue));
        return venuesBloc;
      },
      act: (bloc) => bloc.add(GetVenuesEvent()),
      expect: () => [GetVenuesSuccessState(venueModel: tVenueModel)],
      verify: (_) {
        verify(mockGetVenues()).called(1);
      },
    );

    blocTest<VenuesBloc, VenuesState>(
      'emits [VenueErrorState] when GetVenuesEvent is added and GetVenues returns failure',
      build: () {
        when(
          mockGetVenues(),
        ).thenAnswer((_) async => Left(ServerFailure(message: tErrorMessage)));
        return venuesBloc;
      },
      act: (bloc) => bloc.add(GetVenuesEvent()),
      expect: () => [VenueErrorState(message: '500 ERROR: $tErrorMessage')],
      verify: (_) {
        verify(mockGetVenues()).called(1);
      },
    );
  });
}
