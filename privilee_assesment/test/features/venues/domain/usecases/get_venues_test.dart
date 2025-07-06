import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:privilee_assesment/core/error/failures.dart';
import 'package:privilee_assesment/features/venues/domain/entities/coordinates_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/filter_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/item_category_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/overview_text_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/things_to_do_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_entity.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';
import 'package:privilee_assesment/features/venues/domain/repositories/venues_repository.dart';
import 'package:privilee_assesment/features/venues/domain/usecases/get_venues.dart';

@GenerateMocks([VenueRepository])
import 'get_venues_test.mocks.dart';

void main() {
  late GetVenues usecase;
  late MockVenueRepository mockRepository;

  final tVenueEntity = VenueEntity(
    filters: const [
      FilterEntity(
        name: 'Venue type',
        type: 'multi',
        categories: [FilterCategoryEntity(id: 'cat1', name: 'Gym')],
      ),
    ],
    items: [
      VenueItemEntity(
        section: SectionEntity.hotel,
        name: 'Sample Item Name',
        city: 'Dubai',
        type: SectionEntity.hotel,
        coordinates: const CoordinatesEntity(lat: 0.0, lng: 0.0),
        location: 'Sample Item Location',
        images: const [ImageEntity(url: 'http://example.com/image.jpg')],
        categories: const [
          ItemCategoryEntity(
            id: 'itemCat1',
            category: 'Fitness',
            showOnVenuePage: true,
          ),
        ],
        openingHours: OpeningHoursEntity(),
        accessibleForGuestPass: true,
        overviewText: const [OverviewTextEntity(text: 'Some overview text')],
        thingsToDo: const [
          ThingsToDoEntity(title: 'Swim', subtitle: 'Pool Access'),
        ],
      ),
    ],
    cities: const ['Dubai', 'Abu Dhabi'],
  );

  final tServerFailure = ServerFailure(message: 'Test server error message');

  setUp(() {
    mockRepository = MockVenueRepository();
    usecase = GetVenues(mockRepository);
  });

  group('GetVenues', () {
    test(
      'should get a VenueEntity from the repository when successful',
      () async {
        when(
          mockRepository.getVenues(),
        ).thenAnswer((_) async => Right(tVenueEntity));

        final result = await usecase();

        expect(result, Right(tVenueEntity));
        verify(mockRepository.getVenues()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test(
      'should return a Failure from the repository when unsuccessful',
      () async {
        when(
          mockRepository.getVenues(),
        ).thenAnswer((_) async => Left(tServerFailure));

        final result = await usecase();

        expect(result, Left(tServerFailure));
        verify(mockRepository.getVenues()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
