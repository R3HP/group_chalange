import 'package:hive/hive.dart';

abstract class LocalDataSource {
  Future<void> saveSelectedCityInDB(String selectedCityID);
  Future<void> deleteSelectedCityInDB(String selectedCityID);
  Future<List<String>> getSelectedCitiesFromLocal();
}

class LocalDataSourceImpl implements LocalDataSource {
  final HiveInterface hive;

  LocalDataSourceImpl({
    required this.hive,
  });

  @override
  Future<void> saveSelectedCityInDB(String selectedCityID) async {
    try {
      final selectedCitiesBox = await hive.openBox<String>('selected_cities');
      await selectedCitiesBox.add(selectedCityID);
      await selectedCitiesBox.close();
      return;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  @override
  Future<List<String>> getSelectedCitiesFromLocal() async {
    try {
      final selectedCitiesBox = await hive.openBox<String>('selected_cities');
      final selectedCitiesIdList =selectedCitiesBox.values.toList();
      await selectedCitiesBox.close();
      return selectedCitiesIdList;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  @override
  Future<void> deleteSelectedCityInDB(String selectedCityID) async {
    try {
      final selectedCitiesBox = await hive.openBox<String>('selected_cities');
      final index = selectedCitiesBox.values.toList().indexOf(selectedCityID);
      await selectedCitiesBox.deleteAt(index);
      await selectedCitiesBox.close();
      return;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }
}
