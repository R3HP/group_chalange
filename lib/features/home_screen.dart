import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:theme_notif_challange/features/api/presentation/screen/api_screen.dart';
import 'package:theme_notif_challange/features/location/presentation/widget/location_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(ApiScreen.routeName);
          }, icon: const Icon(Icons.api))
        ],
      ),

      body: const LocationWidget()
    );
  }
}