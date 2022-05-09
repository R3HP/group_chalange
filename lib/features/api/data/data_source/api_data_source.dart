import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:theme_notif_challange/features/api/data/model/response_item.dart';

abstract class ApiDataSource{
  Future<List<ResponseItem>> getApiResponseList();
}

class ApiDataSourceImpl implements ApiDataSource {
  final Dio dio;

  ApiDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<ResponseItem>> getApiResponseList() async {
    try {
      final response = await dio.get('http://netbg.ir/scty.php');

      debugPrint(response.data);
      if (response.statusCode! > 300) {
        throw Exception('resposne status code : ${response.statusCode}');
      }
      final responseListMap = json.decode(response.data) as List<dynamic>;
      // debugPrint(x.toString());
      // final responseList = response.data as List<dynamic>;
      final responseItemList = responseListMap.map((item) => ResponseItem.fromMap(item)).toList();
      return responseItemList;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }
}
