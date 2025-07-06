import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:privilee_assesment/core/error/exceptions.dart';
import 'package:privilee_assesment/core/resources/app_media.dart';
import 'package:privilee_assesment/features/venues/data/datasources/venues_remote_datasource.dart';
import 'package:privilee_assesment/features/venues/data/models/coordinates_model.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_category_model.dart';
import 'package:privilee_assesment/features/venues/data/models/filter_model.dart';
import 'package:privilee_assesment/features/venues/data/models/opening_hours_model.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_item_model.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_model.dart';
import 'package:privilee_assesment/features/venues/domain/entities/venue_item_entity.dart';

import 'venue_remote_datasource_test.mocks.dart';
@GenerateMocks([AssetBundle])
void main() {
  late VenueRemoteDatasourceImpl datasource;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    datasource = VenueRemoteDatasourceImpl(assetBundle: mockAssetBundle);
  });

  group('VenueRemoteDatasourceImpl', () {
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

    final tVenueJson = json.encode({
      'filters': [
        {
          'name': 'Venue type',
          'type': 'multi',
          'categories': [
            {'id': 'Za41RRIAACMA22aW', 'name': 'Hotel'},
          ],
        },
      ],
      'items': [
        {
          'section': 'hotel',
          'name': 'Test Hotel',
          'city': 'Dubai',
          'type': 'hotel',
          'coordinates': {'lat': 25.0, 'lng': 55.0},
          'location': 'Test Location',
          'images': [],
          'categories': [],
          'openingHours': {},
          'accessibleForGuestPass': true,
          'overviewText': [],
          'thingsToDo': [],
        },
      ],
      'cities': ['Dubai', 'Abu Dhabi'],
    });

    group('getVenues', () {
      test(
        'should return VenueModel when assetBundle loads and decodes JSON successfully',
        () async {
          when(
            mockAssetBundle.loadString(AppMedia.hotels),
          ).thenAnswer((_) async => tVenueJson);

          final result = await datasource.getVenues();

          expect(result, equals(tVenueModel));
          verify(mockAssetBundle.loadString(AppMedia.hotels)).called(1);
        },
      );

      test(
        'should throw DataLoadException when assetBundle fails to load JSON',
        () async {
          final tException = DataLoadException('Failed to load asset');
          when(
            mockAssetBundle.loadString(AppMedia.hotels),
          ).thenThrow(tException);

          final call = datasource.getVenues;

          expect(() => call(), throwsA(isA<DataLoadException>()));
          verify(mockAssetBundle.loadString(AppMedia.hotels)).called(1);
        },
      );

      test(
        'should throw ServerException when JSON decoding fails with FormatException',
        () async {
          when(
            mockAssetBundle.loadString(AppMedia.hotels),
          ).thenAnswer((_) async => 'invalid json');

          final call = datasource.getVenues;

          expect(
            () => call(),
            throwsA(
              isA<ServerException>()
                  .having((e) => e.message, 'message', 'Format exception')
                  .having((e) => e.statusCode, 'statusCode', 503),
            ),
          );
          verify(mockAssetBundle.loadString(AppMedia.hotels)).called(1);
        },
      );

      test(
        'should throw ServerException for other unexpected errors',
        () async {
          final tException = Exception('Unexpected error');
          when(
            mockAssetBundle.loadString(AppMedia.hotels),
          ).thenThrow(tException);
          final call = datasource.getVenues;
          expect(
            () => call(),
            throwsA(
              isA<ServerException>()
                  .having((e) => e.message, 'message', tException.toString())
                  .having((e) => e.statusCode, 'statusCode', 500),
            ),
          );
          verify(mockAssetBundle.loadString(AppMedia.hotels)).called(1);
        },
      );
    });
  });
}
