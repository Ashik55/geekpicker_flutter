import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/modules/componenets/custom_textfield.dart';
import 'package:geekpicker_flutter/app/modules/componenets/custom_textwidget.dart';
import 'package:geekpicker_flutter/app/modules/componenets/rounded_button.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';
import 'package:geekpicker_flutter/app/utils/utility.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Scaffold(
            backgroundColor: KColors.KBackgrounColor,
            appBar: AppBar(
              backgroundColor: KColors.KBackgrounColor,
              leading: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(Dimens.basePaddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: "Welcome",
                    textColor: KColors.KTextPrimaryColor,
                    textSize: Dimens.titleLargeDoubleExtra,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 2),
                  CText(
                    text: "Sign up to continue",
                    textColor: KColors.KBlack,
                    textSize: Dimens.titleLargeDoubleExtra,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 40),
                  Card(
                      elevation: 0,
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.radiusNone),
                          side: BorderSide(color: KColors.KBoarderColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CTextField(
                            hintText: "Your Email".toUpperCase(),
                            textSize: Dimens.title,
                            textEditingController: controller.emailController,
                            radius: Dimens.radiusNone,
                            strokeColor: Colors.transparent,
                          ),
                          Divider(
                            color: KColors.KBoarderColor,
                            height: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CTextField(
                                  hintText: "password".toUpperCase(),
                                  obscureText: controller.obsecureText,
                                  textEditingController:
                                      controller.passwordController,
                                  onChange: (text) =>
                                      controller.onPasswordChange(text),
                                  radius: Dimens.radiusNone,
                                  strokeColor: Colors.transparent,
                                ),
                              ),
                              if (controller.showObsecureIcon)
                                IconButton(
                                    onPressed: () =>
                                        controller.onEyeButtonClick(),
                                    icon: Icon(
                                      controller.obsecureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: KColors.KObsecureColor,
                                    ))
                            ],
                          ),
                        ],
                      )),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: "Don't have account? ",
                        textColor: KColors.KBlack,
                        textSize: Dimens.title,
                        fontWeight: FontWeight.w400,
                      ),
                      InkWell(
                        onTap: ()=> controller.onSigninClick(),
                        child: CText(
                          text: "Sign up",
                          textColor: KColors.KTextPrimaryColor,
                          textSize: Dimens.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  CRoundedButton(
                    width: getMaxWidth(context),
                    onClick: () => controller.onLoginClick(),
                    radius: Dimens.radiusMin,
                    elevation: 0,
                    textWidget: CText(
                      text: 'Log in',
                      textSize: Dimens.title,
                      textColor: KColors.KLiteBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )));
  }
}
