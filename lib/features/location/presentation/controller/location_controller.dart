import 'package:location/location.dart';

import 'package:theme_notif_challange/features/location/data/model/my_location_data.dart';
import 'package:theme_notif_challange/features/location/domain/usecase/get_location_from_local.dart';
import 'package:theme_notif_challange/features/location/domain/usecase/save_location_in_local_use_case.dart';

class LocationController {
  final SaveLocationInLocal saveLocationInLocal;
  final GetLocationFromLocal getLocationFromLocal;

  LocationController({
    required this.saveLocationInLocal,
    required this.getLocationFromLocal,
  });




  Future<MyLocationData> getCurrentLocationAndSaveIt()async {
    final locationData = await Location.instance.getLocation();
    final myLocationData = MyLocationData(latitude: locationData.latitude!.toStringAsFixed(0), longitude: locationData.longitude!.toStringAsFixed(0));
    await saveLocation(myLocationData.latitude, myLocationData.longitude);
    return myLocationData;
  }

  Future<void> saveLocation(String latitude,String longitude) async{
    final response = saveLocationInLocal(latitude,longitude);
    return response;
  }

  Future<MyLocationData?> getLocationFromLocalDB() async {
    final myLocationData = await getLocationFromLocal();
    return myLocationData;
  }



}
