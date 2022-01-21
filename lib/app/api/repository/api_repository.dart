import 'package:geekpicker_flutter/app/api/provider/api_provider.dart';
import 'package:get/get.dart';

class APIRepository extends GetxService {
  final APIProvider _apiProvider = Get.find();

  getDashboard() async {
    return await _apiProvider.getDashboard();
  }


  readDashBoardLocal() async {
    return await _apiProvider.readDashBoardLocal();
  }

}
