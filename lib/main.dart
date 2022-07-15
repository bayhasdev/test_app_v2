import 'package:flutter/material.dart';
import 'package:test_app_v2/src/main_page.dart';
import 'package:test_app_v2/src/ui/components/error_widget.dart';
import 'package:test_app_v2/src/utilities/locale_delegate.dart';

void main() {
  ErrorWidget.builder = ErrorWidgets().materialErrorWidget;
  // debugRepaintRainbowEnabled = true;
  // debugRepaintTextRainbowEnabled = true;
  // debugProfilePaintsEnabled = true;
  // debugRepaintRainbowEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // checkerboardRasterCacheImages: true,
      // checkerboardOffscreenLayers: true,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: LocalDelegate.localizationsDelegates,
      supportedLocales: LocalDelegate.supportedLocales,
      localeResolutionCallback: LocalDelegate.localeResolutionCallback,
      locale: Locale('en', ''),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF8c77ec)),
      ),
      home: const MainPage(),
    );
  }
}
