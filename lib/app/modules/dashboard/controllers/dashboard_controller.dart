import 'dart:convert';
import 'dart:developer';

import 'package:geekpicker_flutter/app/api/repository/api_repository.dart';
import 'package:geekpicker_flutter/app/data/remote/dashboard_response.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final APIRepository _apiRepository = Get.find();
  DashboardResponse? dashboardResponse;

  @override
  void onInit() {
    super.onInit();
    readLocalJson();
  }

  void readLocalJson() async {
    final result = await _apiRepository.readDashBoardLocal();
    log(result);
    if (result != null) {
      dashboardResponse = DashboardResponse.fromJson(json.decode(result));
    }
    update();
  }

  onTransactionLongPressed() {}
}
