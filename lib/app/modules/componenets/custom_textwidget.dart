import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';


class CText extends StatelessWidget {
  String? text;
  double? textSize;
  Color? textColor;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double? textScaleFactor;
  int? maxLines;
  TextDecoration? decoration;

  CText(
      {required this.text,
      this.textSize,
      this.textColor,
      this.fontWeight,
      this.textAlign,
      this.textScaleFactor,
      this.decoration,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      overflow: TextOverflow.ellipsis,
      textScaleFactor: textScaleFactor,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: GoogleFonts.lato(
        decoration: decoration,
        fontSize: textSize ?? Dimens.titleMid,
        color: textColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
