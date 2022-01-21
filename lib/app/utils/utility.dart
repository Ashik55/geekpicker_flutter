import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'constants.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
const _chars_text = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String getRandomTextString(int length) =>
    String.fromCharCodes(Iterable.generate(length,
        (_) => _chars_text.codeUnitAt(_rnd.nextInt(_chars_text.length))));

int getRandomNumber({int? length}) => _rnd.nextInt(length ?? 5500000);

String getFormattedDate(String? date) {
  return DateFormat("dd-MMM-yyyy").format(DateTime.parse('$date')).toString();
}

showMaterialDatePicker(BuildContext context, {String? midDivider}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101));
  if (picked != null) {
    String divider = midDivider ?? "/";
    return "${picked.day}$divider${picked.month}$divider${picked.year}";
  }


}


hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getMaxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}


getSimpleFraction({required String? value, int? fractionDigit}) {
  return num.parse("$value").toStringAsFixed(fractionDigit ?? 2);
}

bool isListNullOrEmpty(List<dynamic>? list) {
  if (list == null) {
    return true;
  } else if (list.isEmpty) {
    return true;
  } else {
    return false;
  }
}

extension Extension on Object {
  bool isNullOrEmpty() => this == null || this == [];
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
