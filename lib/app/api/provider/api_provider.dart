import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geekpicker_flutter/app/api/client/api_client.dart';
import 'package:geekpicker_flutter/app/utils/view_helper.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:path/path.dart';

class APIProvider extends GetxService {
  final ApiClient _apiClient = Get.find();

  getDashboard() async {
    try {
      final result = await _apiClient.request(
        "dashboard",
        Method.GET,
      );
      return result;
    } on Exception catch (e) {
      showMessageSnackbar(e.toString());
    }
  }

  //read from from asset file as local json
  readDashBoardLocal() async {
    final jsonData = await rootBundle.loadString('assets/json/response.json');
    return jsonData;
  }
}
