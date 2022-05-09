import 'package:flutter/material.dart';

import 'package:theme_notif_challange/core/service_locator.dart';
import 'package:theme_notif_challange/features/api/data/model/response_item.dart';
import 'package:theme_notif_challange/features/api/presentation/controller/api_controller.dart';
import 'package:theme_notif_challange/features/api/presentation/widget/response_list_item.dart';

class ApiScreen extends StatelessWidget {
  static const routeName = 'api_screen';
  ApiScreen({Key? key}) : super(key: key);

  final ApiController apiController = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api List'),
      ),
      body: FutureBuilder(
          future: apiController.getCities(),
          builder: (ctx, AsyncSnapshot<List<ResponseItem>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: const CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) => ResponseListItem(
                  city: snapshot.data![index],
                ),
              );
            }
          }),
    );
  }
}


