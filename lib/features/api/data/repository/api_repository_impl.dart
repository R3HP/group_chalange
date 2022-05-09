import 'package:flutter/material.dart';

import 'package:theme_notif_challange/features/api/data/data_source/api_data_source.dart';
import 'package:theme_notif_challange/features/api/data/data_source/local_data_source.dart';
import 'package:theme_notif_challange/features/api/data/model/response_item.dart';
import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiDataSource apiDataSource;
  final LocalDataSource localDataSource;

  ApiRepositoryImpl({
    required this.apiDataSource,
    required this.localDataSource,
  });
  @override
  Future<List<ResponseItem>> getApiResposne() async {
    try {
      final list = await apiDataSource.getApiResponseList();
      return list;
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }

  @override
  Future<void> saveSelectedCityInLocal(String selectedCityID) async {
    try {
      final response = await localDataSource.saveSelectedCityInDB(selectedCityID);
      return response;
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }

  @override
  Future<List<String>> getSelectedCitiesIdFromLocal() async {
    try {
      final selectedCities = await localDataSource.getSelectedCitiesFromLocal();
      return selectedCities;
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }

  @override
  Future<void> deleteSelectedCityInLocal(String selectedCityID) async {
    try {
      final resposne = await localDataSource.deleteSelectedCityInDB(selectedCityID);
      return resposne;
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }
}
