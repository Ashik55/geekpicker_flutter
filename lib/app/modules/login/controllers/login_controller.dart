import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/data/local_storage/local_storage.dart';
import 'package:geekpicker_flutter/app/routes/app_pages.dart';
import 'package:geekpicker_flutter/app/utils/utility.dart';
import 'package:geekpicker_flutter/app/utils/view_helper.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LocalStorage _localStorage = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  bool showObsecureIcon = false;

  @override
  void onInit() {
    super.onInit();
  }

  onLoginClick() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      hideKeyboard();
      if (emailController.text == _localStorage.getUserEmail() &&
          passwordController.text == _localStorage.getUserPass()) {
        Get.toNamed(Routes.DASHBOARD);
        showSuccessSnackbar("Logged in successfully");
      }
    } else {
      showErrorSnackbar("Email & Password wrong");
    }
  }

  onPasswordChange(String? text) {
    if (text?.isNotEmpty == true) {
      showObsecureIcon = true;
      update();
    }
  }

  onEyeButtonClick() {
    obsecureText = !obsecureText;
    update();
  }

  onSigninClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(Routes.REGISTRATION);
  }
}
