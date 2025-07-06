import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:privilee_assesment/core/error/exceptions.dart';
import 'package:privilee_assesment/core/resources/app_media.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_model.dart';

abstract class VenueRemoteDatasource {
  Future<VenueModel> getVenues();
}

class VenueRemoteDatasourceImpl implements VenueRemoteDatasource {
  final AssetBundle assetBundle;

  VenueRemoteDatasourceImpl({required this.assetBundle});

  @override
  Future<VenueModel> getVenues() async {
    try {
      final hotelsJson = await assetBundle.loadString(AppMedia.hotels);

      final VenueModel hotels = _decodeVenues(hotelsJson);

      return hotels;
    } on DataLoadException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  VenueModel _decodeVenues(String jsonString) {
    try {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      return VenueModel.fromJson(jsonMap);
    } on FormatException {
      throw ServerException(message: 'Format exception', statusCode: 503);
    }
  }
}
