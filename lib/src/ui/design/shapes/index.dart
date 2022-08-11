import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design/shapes/CircleSlice_page.dart';
import 'package:test_app_v2/src/ui/design/shapes/ClipPathDemo.dart';
import 'package:test_app_v2/src/ui/design/shapes/CustomPainter_page.dart';
import 'package:test_app_v2/src/ui/design/shapes/shape_coleection.dart';

class ShapesPage extends StatefulWidget {
  static const String routeName = '/ShapesPage';
  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shapes Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CircleSlicesWidget(),
            ListViewSingleItem(title: 'Custom Painter Page', navigationWidget: CustomPainterPage()),
            ListViewSingleItem(title: 'Clip Path Demo', navigationWidget: ClipPathDemo()),
            ListViewSingleItem(title: 'Shape Collection Page', navigationWidget: ShapeCollectionPage()),
          ],
        ),
      ),
    );
  }
}
