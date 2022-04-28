import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get appTheme => Theme.of(this);
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
}

extension AddSpaceExtension on BuildContext {
  Widget addWidth(double width) => SizedBox(width: width);
  Widget addHeight(double height) => SizedBox(height: height);
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);

  Future<void> pop({Object? data}) async => navigation.pop(data);

  void popUntil(String path, {Object? data}) => navigation.popUntil(ModalRoute.withName(path));

  Future<T?> pushNamed<T>(String path, {Object? data}) async {
    return await navigation.pushNamed<T>(path, arguments: data);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String path, {String untilPath = '/', Object? data}) async {
    return await Navigator.of(this).pushNamedAndRemoveUntil(path, ModalRoute.withName(untilPath), arguments: data);
  }

  Future<T?> pushReplacementNamed<T>(String path, {Object? data}) async {
    return await Navigator.of(this).pushReplacementNamed(path, arguments: data);
  }

  Future<T> navigateDialog<T>(Widget dialog) async {
    return await navigation.push(
      MaterialPageRoute(
        builder: (BuildContext context) => dialog,
        fullscreenDialog: true,
        // this flag will provide out screen “close symbol” in the top left corner instead of the default “back arrow”.
        //  On iOS devices, it also affects swipe back behavior.
      ),
    );
  }

  Future<T> navigatePage<T>(Widget page) async {
    return await navigation.push(
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }
}
