import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const String fontFamily = 'Tajawal';

  static const standardPadding = EdgeInsets.all(16);

  static const boxShadow = [BoxShadow(blurRadius: 22, color: Colors.black12, offset: Offset(0, 6))];

  static const double borderRadiusValue = 5.0;
  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(borderRadiusValue));

  static InputDecoration getBorderdTextFieldDecoration({String? lable, String? hint, EdgeInsets? contentPadding}) {
    return InputDecoration(
      labelText: lable,
      hintText: hint,
      labelStyle: const TextStyle(fontSize: 16),
      isDense: true,
      contentPadding: contentPadding ?? contentPadding,
      border: const OutlineInputBorder(borderSide: BorderSide()),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
    );
  }

  static InputDecoration getFilledTextFieldDecoration({String? lable, String? hint, EdgeInsets? contentPadding}) {
    return InputDecoration(
      labelText: lable,
      hintText: hint,
      fillColor: Colors.grey.shade100,
      filled: true,
      labelStyle: const TextStyle(fontSize: 16),
      isDense: false,
      contentPadding: contentPadding ?? contentPadding,
      border: InputBorder.none,
    );
  }

  static InputDecoration getTextFieldDecoration({String? lable, String? hint, EdgeInsets? contentPadding}) {
    return InputDecoration(
      labelText: lable,
      hintText: hint,
      labelStyle: const TextStyle(fontSize: 12),
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  static Decoration getContainerBorderDecoration() {
    return BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(borderRadiusValue));
  }

  static void setstatusBarColor({Color color = Colors.white, Brightness? brightness}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness ?? Brightness.dark,
    ));
  }
}
