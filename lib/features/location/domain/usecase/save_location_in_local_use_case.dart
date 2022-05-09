import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class SaveLocationInLocal {
  

  Future<void> call(String latitude,String longitude) async {
    try {
      final locationBox = await Hive.openBox('location');
      await locationBox.put('latitude', latitude);
      await locationBox.put('longitude', longitude);
      await locationBox.close();
      return ;
    } catch (exception) {
      throw ErrorDescription(exception.toString());
    }
  }
}