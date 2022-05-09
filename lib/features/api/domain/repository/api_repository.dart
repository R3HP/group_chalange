import 'package:theme_notif_challange/features/api/data/model/response_item.dart';

abstract class ApiRepository{
  Future<List<ResponseItem>> getApiResposne();
  Future<void> saveSelectedCityInLocal(String selectedCityID);
  Future<void> deleteSelectedCityInLocal(String selectedCityID);
  Future<List<String>> getSelectedCitiesIdFromLocal();
}