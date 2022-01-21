import 'package:flutter/material.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';

class CTextField extends StatelessWidget {
  Function(String?)? onChange;
  TextEditingController? textEditingController;
  TextInputType? textInputType;
  bool? obscureText;
  String? hintText;
  Icon? prefixIcon;
  Widget? suffixWidget;
  Widget? prefix;
  double? width;
  double? height;
  double? radius;
  Color? fillColor;
  Color? strokeColor;
  Color? textColor;
  bool? autofocus;
  TextAlign? textAlign;
  double? textSize;
  FontWeight? fontWeight;

  CTextField({
    required this.textEditingController,
    this.onChange,
    this.textInputType,
    required this.hintText,
    this.obscureText,
    this.width,
    this.height,
    this.radius,
    this.fillColor,
    this.strokeColor,
    this.prefixIcon,
    this.prefix,
    this.autofocus,
    this.textAlign,
    this.textSize,
    this.textColor,
    this.fontWeight,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height ?? Dimens.textFieldNormal,
        width: width,
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          textAlign: textAlign ?? TextAlign.start,
          controller: textEditingController,
          obscureText: obscureText ?? false,
          autofocus: autofocus ?? false,
          onChanged: onChange,
          decoration: InputDecoration(
              suffix: suffixWidget,
              filled: fillColor != null,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              prefix: prefix,
              counterText: '',
              hintText: hintText ?? "Email or Phone Number",
              hintStyle: TextStyle(
                  color: Colors.grey.shade500, fontSize: textSize ?? Dimens.title),
              contentPadding: textAlign != TextAlign.center
                  ? EdgeInsets.only(left: 15)
                  : EdgeInsets.only(left: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: strokeColor ?? KColors.KBoarderColor),
                borderRadius:
                    BorderRadius.circular(radius ?? Dimens.radiusLarge),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: strokeColor ?? KColors.KBoarderColor),
                borderRadius:
                    BorderRadius.circular(radius ?? Dimens.radiusLarge),
              )),
          style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w500, fontSize: textSize ?? Dimens.title, color: textColor),
          keyboardType: textInputType ?? TextInputType.text,
          maxLines: 1,
        ),
      ),
    );
  }
}
