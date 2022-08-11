// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design/animation/_animation_index.dart';
import 'package:test_app_v2/src/ui/design/bottom_navigation/_bottom_navigation_index.dart';
import 'package:test_app_v2/src/ui/design/circular_background.dart';
import 'package:test_app_v2/src/ui/design/shapes/index.dart';

class DesignPage extends StatefulWidget {
  static const String routeName = '/DesigPage';
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'Animations', navigationWidget: AnimationIndex()),
            ListViewSingleItem(title: 'Shapes Page', navigationWidget: ShapesPage()),
            ListViewSingleItem(title: 'BottomNavigationIndex', navigationWidget: BottomNavigationIndex()),
            ListViewSingleItem(title: 'CircularBackgroundPage', navigationWidget: CircularBackgroundPage()),
            MergeSemantics(),
          ],
        ),
      ),
    );
  }
}
