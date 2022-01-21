import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';

class CRoundedButton extends StatelessWidget {
  double? elevation;
  double? height;
  double? width;
  VoidCallback? onClick;
  Color? backgroundColor;
  double? radius;
  Widget textWidget;

  CRoundedButton({
    required this.onClick,
    required this.textWidget,
    this.elevation,
    this.height,
    this.width,
    this.backgroundColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Dimens.buttonHight,
      width: width,
      child: ElevatedButton(
          child: textWidget,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: MaterialStateProperty.all<Color>(
                  backgroundColor ?? KColors.KPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(radius ?? Dimens.radiusLarge),
                      side: BorderSide.none))),
          onPressed: onClick),
    );
  }
}
