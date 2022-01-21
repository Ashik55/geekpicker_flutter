import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:geekpicker_flutter/app/modules/componenets/custom_textfield.dart';
import 'package:geekpicker_flutter/app/modules/componenets/custom_textwidget.dart';
import 'package:geekpicker_flutter/app/modules/componenets/rounded_button.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';
import 'package:geekpicker_flutter/app/utils/utility.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        builder: (controller) => Scaffold(
            backgroundColor: KColors.KBackgrounColor,
            appBar: AppBar(
              backgroundColor: KColors.KBackgrounColor,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  )),
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(Dimens.basePaddingLarge),
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
                            thickness: 1,
                            height: 3,
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
                  SizedBox(height: 24),
                  Row(
                    children: [
                      AdvancedSwitch(
                        controller: controller.switchController,
                        inactiveColor: KColors.KSwitchBGColor,
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        'I have read, understood, and agree to ',
                                    style: GoogleFonts.lato(
                                      fontSize: Dimens.titleMid,
                                      color: KColors.KBlack,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "walletory's ",
                                  style: GoogleFonts.lato(
                                    decoration: TextDecoration.underline,
                                    fontSize: Dimens.titleMid,
                                    color: KColors.KTextPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '"Terms & Conditions"',
                                  style: GoogleFonts.lato(
                                    decoration: TextDecoration.underline,
                                    fontSize: Dimens.titleMid,
                                    color: KColors.KTextPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '  and  ',
                                  style: GoogleFonts.lato(
                                    fontSize: Dimens.titleMid,
                                    color: KColors.KBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '"Privacy Policy"',
                                  style: GoogleFonts.lato(
                                    decoration: TextDecoration.underline,
                                    fontSize: Dimens.titleMid,
                                    color: KColors.KTextPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: "Already have account? ",
                        textColor: KColors.KBlack,
                        textSize: Dimens.title,
                        fontWeight: FontWeight.w400,
                      ),
                      InkWell(
                        onTap: () => controller.onSigninClick(),
                        child: CText(
                          text: "Sign in",
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
                    onClick: () => controller.onCreateClick(),
                    radius: Dimens.radiusMin,
                    elevation: 0,
                    textWidget: CText(
                      text: 'Create Account',
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
