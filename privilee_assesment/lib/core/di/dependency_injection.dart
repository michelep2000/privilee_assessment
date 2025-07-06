import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:privilee_assesment/features/venues/bloc/venues_bloc.dart';
import 'package:privilee_assesment/features/venues/data/datasources/venues_remote_datasource.dart';
import 'package:privilee_assesment/features/venues/data/repositories/venue_repository_impl.dart';
import 'package:privilee_assesment/features/venues/domain/repositories/venues_repository.dart';
import 'package:privilee_assesment/features/venues/domain/usecases/get_venues.dart';

final sl = GetIt.instance;

void init() {
  // -------------------- Use cases ---------------------
  sl.registerLazySingleton(() => GetVenues(sl()));

  // -------------------- Repository --------------------
  sl.registerLazySingleton<VenueRepository>(
    () => VenueRepositoryImpl(remoteDatasource: sl()),
  );

  // -------------------- Datasources -------------------
  sl.registerLazySingleton<VenueRemoteDatasource>(
    () => VenueRemoteDatasourceImpl(assetBundle: sl()),
  );

  // -------------------- External ----------------------
  sl.registerLazySingleton<AssetBundle>(() => rootBundle);

  // -------------------- BLoC --------------------------
  sl.registerFactory(() => VenuesBloc(getVenues: sl()));
}
