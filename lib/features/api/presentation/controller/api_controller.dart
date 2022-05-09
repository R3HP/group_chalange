import 'package:flutter/cupertino.dart';

import 'package:theme_notif_challange/features/api/data/model/response_item.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/delete_selected_city_from_local.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/get_api_list_use_case.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/get_selected_cities_id_from_local.dart';
import 'package:theme_notif_challange/features/api/domain/usecase/save_selected_city_in_local.dart';

class ApiController {
  final GetApiListResponseUseCase getApiListResponseUseCase;
  final SaveSelectedCityInLocalUseCase saveSelectedCityInLocal;
  final GetSelectedCitiesIdFromLocalUseCase getSelectedCitiesIdFromLocalUseCase;
  final DeleteSelectedCityFromLocal deleteSelectedCityFromLocal;

  ApiController({
    required this.getApiListResponseUseCase,
    required this.saveSelectedCityInLocal,
    required this.getSelectedCitiesIdFromLocalUseCase,
    required this.deleteSelectedCityFromLocal,
  });

  Future<List<ResponseItem>> getApiResponseItemList() async {
    final responseItemList = await getApiListResponseUseCase();
    return responseItemList;
  }

  Future<void> selectCity(String cityID){
    final response = saveSelectedCityInLocal(cityID);
    return response;
  }

  Future<void> unselectCity(String cityID) async{
    final response = await deleteSelectedCityFromLocal(cityID);
    return response;
  }

  Future<List<String>> getSelectedCitiesIdFromLocal() async {
    final selectedCitiesIdList = await getSelectedCitiesIdFromLocalUseCase();
    return selectedCitiesIdList;
  }

  Future<List<ResponseItem>> getCities() async{
    final cities = await getApiResponseItemList();
    final selectedCitiesIdList = await getSelectedCitiesIdFromLocal();
    debugPrint(selectedCitiesIdList.toString());
    final citiesFiltered = cities..forEach((city) {
      if (selectedCitiesIdList.contains(city.id)) {
        city.toggleSelection();
      }
    });
    return citiesFiltered;
  }
  
}
