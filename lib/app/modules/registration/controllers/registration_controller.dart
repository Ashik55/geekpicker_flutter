import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/data/local_storage/local_storage.dart';
import 'package:geekpicker_flutter/app/routes/app_pages.dart';
import 'package:geekpicker_flutter/app/utils/utility.dart';
import 'package:geekpicker_flutter/app/utils/view_helper.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final LocalStorage _localStorage = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final switchController = ValueNotifier<bool>(false);
  bool obsecureText = true;
  bool showObsecureIcon = false;
  bool switchValue = false;

  @override
  void onInit() {
    super.onInit();

    switchController.addListener(() {
      switchValue = switchController.value;
      update();
    });
  }

  onCreateClick() {

    if (emailController.text.isNotEmpty || passwordController.text.isNotEmpty) {
      if (switchValue == true) {
        hideKeyboard();
        print("workkkk");
        _localStorage.setUserEmail(emailController.text);
        _localStorage.setUserEmail(passwordController.text);

        Get.back();
        showSuccessSnackbar("Account created successfully");

      } else {
        showWarningSnackbar("Please allow terms & condition switch");
      }
    } else {
      showErrorSnackbar("Email & Password cannot be empty");
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
    Get.back();
  }
}
