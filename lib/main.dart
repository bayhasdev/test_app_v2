import 'package:flutter/material.dart';
import 'package:test_app_v2/src/main_page.dart';

void main() {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
    );
  }
}
