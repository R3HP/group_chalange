import 'package:flutter/material.dart';
import 'package:theme_notif_challange/core/service_locator.dart';
import 'package:theme_notif_challange/features/location/data/model/my_location_data.dart';
import 'package:theme_notif_challange/features/location/presentation/controller/location_controller.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({ Key? key }) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final LocationController locationController= sl();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            flex: 5,
            child: FutureBuilder(
              future: locationController.getLocationFromLocalDB(),
              builder: (ctx , AsyncSnapshot<MyLocationData?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator.adaptive(),);
                } else if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }else{

                if (snapshot.data == null) {
                  return Column(
                    children: [
                      Text('Your Location Isn\'t in DataBase')
                    ],
                  );
                } else {
                return Column(
                children: [
                  Text('Latitude : ${snapshot.data!.latitude}'),
                  Text('Longitude : ${snapshot.data!.longitude}'),
                ],
              );
                }
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () async {
                await locationController.getCurrentLocationAndSaveIt();
                setState(() {});
              }, child: const Text('Get My Location')),
            ),
          )
        ],
      );
  }
}