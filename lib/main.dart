import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/api/client/api_client.dart';
import 'app/api/provider/api_provider.dart';
import 'app/api/repository/api_repository.dart';
import 'app/data/local_storage/local_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/colors.dart';
import 'app/utils/utility.dart';

void main() async {
  // Inject dependancies
  await GetStorage.init();
  Get.put<LocalStorage>(LocalStorage());
  await Get.putAsync<ApiClient>(() => ApiClient().init());
  await Get.putAsync<APIProvider>(() async => APIProvider());
  await Get.putAsync<APIRepository>(() async => APIRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(KColors.KPrimaryColor),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: "Sindabad Super App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
