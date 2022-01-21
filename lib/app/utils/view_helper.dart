import 'package:flutter/material.dart';
import 'package:get/get.dart';

showMessageSnackbar(String? message,
    {SnackPosition? snackPosition, Duration? duration}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: duration ?? Duration(milliseconds: 2000),
    snackPosition: SnackPosition.BOTTOM,
  ));
}

showErrorSnackbar(String? message) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    backgroundColor: Colors.red.shade700,
    duration: const Duration(milliseconds: 3000),
  ));
}


showSuccessSnackbar(String? message) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    backgroundColor: Colors.green,
    duration: const Duration(milliseconds: 3000),
  ));
}


showWarningSnackbar(String? message) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    backgroundColor: Colors.orange,
    duration: const Duration(milliseconds: 3000),
  ));
}
