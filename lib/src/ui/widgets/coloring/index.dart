import 'package:flutter/material.dart';
import '../../../../main_imports.dart';

class ColoringPage extends StatefulWidget {
  static const String routeName = '/ColoringPage';
  @override
  _ColoringPageState createState() => _ColoringPageState();
}

class _ColoringPageState extends State<ColoringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coloring Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _imageColoring(),
          ],
        ),
      ),
    );
  }

  /* 
 ref : https://www.woolha.com/tutorials/flutter-using-colorfiltered-widget-examples
  | R' |   | a00 a01 a02 a03 a04 |   | R |
  | G' |   | a10 a11 a22 a33 a44 |   | G |
  | B' | = | a20 a21 a22 a33 a44 | * | B |
  | A' |   | a30 a31 a22 a33 a44 |   | A |
  | 1  |   |  0   0   0   0   1  |   | 1 |
 */
  Widget _imageColoring() {
    Widget image = Image.asset('assets/images/ddd.png', height: 100);
    const ColorFilter greyscale =
        ColorFilter.matrix(<double>[
          0.2126, 0.7152, 0.0722, 0, 0, 0.2126, 0.7152, 0.0722, 0, 0, 0.2126, 0.7152, 0.0722, 0, 0, 0, 0, 0, 1, 0]);

    return Row(
      children: [
        image,
        ColorFiltered(
          colorFilter: greyscale,
          child: image,
        ),
        ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
          child: image,
        ),
      ].expadedEqually().toList(),
    );
  }
}
