import 'package:geekpicker_flutter/app/api/client/api_client.dart';
import 'package:geekpicker_flutter/app/api/provider/api_provider.dart';
import 'package:geekpicker_flutter/app/api/repository/api_repository.dart';
import 'package:geekpicker_flutter/app/data/local_storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Injector {
  injectDependancies() async {
    await GetStorage.init();
    Get.put<LocalStorage>(LocalStorage());
    await Get.putAsync<ApiClient>(() => ApiClient().init());
    await Get.putAsync<APIProvider>(() async => APIProvider());
    await Get.putAsync<APIRepository>(() async => APIRepository());
  }
}
