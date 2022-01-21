import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
                body: ListView(
              children: [
                Row(
                  children: [
                SvgPicture.asset(
                  'assets/icons/ic_logo.svg',
                  fit: BoxFit.cover,
                  color: Colors.grey.shade200,
                )

                  ],
                )

              ],
            )));
  }
}
