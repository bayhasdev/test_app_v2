// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/ui_chalnge/face_pile_demo_page.dart';

class UIChalnage extends StatefulWidget {
  static const String routeName = '/UIChalnage';
  @override
  _UIChalnageState createState() => _UIChalnageState();
}

class _UIChalnageState extends State<UIChalnage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Chalnage'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            ListViewSingleItem(title: 'Face Pile Demo ', navigationWidget: FacePileDemoScreen()),
          ],
        ),
      ),
    );
  }
}
