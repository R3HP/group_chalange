
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:theme_notif_challange/features/api/data/data_source/api_data_source.dart';
import 'package:theme_notif_challange/features/api/data/data_source/local_data_source.dart';
import 'package:theme_notif_challange/features/api/data/repository/api_repository_impl.dart';
import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/delete_selected_city_from_local.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/get_api_list_use_case.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/get_selected_cities_id_from_local.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/save_selected_city_in_local.dart';
import 'package:theme_notif_challange/features/api/presentation/controller/api_controller.dart';
import 'package:theme_notif_challange/features/location/domain/usecase/get_location_from_local.dart';
import 'package:theme_notif_challange/features/location/domain/usecase/save_location_in_local_use_case.dart';
import 'package:theme_notif_challange/features/location/presentation/controller/location_controller.dart';

final sl = GetIt.instance;

void setUp(){
  // api 

  // controller 
  sl.registerLazySingleton<ApiController>(() => ApiController(getApiListResponseUseCase: sl(),getSelectedCitiesIdFromLocalUseCase: sl(),saveSelectedCityInLocal: sl(),deleteSelectedCityFromLocal: sl()));

  // useCase
  sl.registerLazySingleton<GetApiListResponseUseCase>(() => GetApiListResponseUseCase(apiRepository: sl()));
  sl.registerLazySingleton<SaveSelectedCityInLocalUseCase>(() => SaveSelectedCityInLocalUseCase(apiRepository: sl()));
  sl.registerLazySingleton<GetSelectedCitiesIdFromLocalUseCase>(() => GetSelectedCitiesIdFromLocalUseCase(apiRepository: sl()));
  sl.registerLazySingleton<DeleteSelectedCityFromLocal>(() => DeleteSelectedCityFromLocal(apiRepository: sl()));

  // repository
  sl.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl(apiDataSource: sl(),localDataSource: sl()));

  // dataSource
  sl.registerLazySingleton<ApiDataSource>(() => ApiDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(hive: sl()));


  // location

  //controller 
  sl.registerLazySingleton<LocationController>(() => LocationController(saveLocationInLocal: sl(), getLocationFromLocal: sl()));

  // usecase 
  sl.registerLazySingleton<SaveLocationInLocal>(() => SaveLocationInLocal());
  sl.registerLazySingleton<GetLocationFromLocal>(() => GetLocationFromLocal());


  // dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // hive
  sl.registerLazySingleton<HiveInterface>(() => Hive);

}