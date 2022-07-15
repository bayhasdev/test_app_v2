import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:test_app_v2/generated/locale_base.dart';

late LocaleBase str;

class GlobalVar {
  static String getString(String? string, [String defultValue = ""]) => string ?? defultValue;
  static bool checkString(String? string) => string != null && string.isNotEmpty;

  static String numToString(dynamic value, [String defultValue = '0']) => value != null ? value.toString() : defultValue;
  static String doubleToString(dynamic value, [String defultValue = '0.0']) => value != null ? value.toStringAsFixed(2) : defultValue;

  static DateTime dateResetClock({DateTime? date}) {
    date ??= DateTime.now();
    return DateTime(date.year, date.month, date.day);
  }

  static dynamic getFirstListItem(List list) => checkListNotEmpty(list) ? list.first : null;

  static bool checkListNotEmpty(List? list) => list != null && list.isNotEmpty;

  static String getIdFromUrl(String url) {
    return url.split('/').last;
  }

  static void log(String message) {
    if (kDebugMode) {
      developer.log(message);
    }
  }
}
