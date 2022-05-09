import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:theme_notif_challange/features/location/data/model/my_location_data.dart';

class GetLocationFromLocal{


  Future<MyLocationData?> call() async {
    try {
      final locationBox = await Hive.openBox('location');
      final latitude = await locationBox.get('latitude');
      final longitude = await locationBox.get('longitude');
      if (longitude == null || latitude == null) {
        return null;
      }
      return MyLocationData(latitude: latitude, longitude: longitude);
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }
}