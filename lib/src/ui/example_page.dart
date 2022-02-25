import 'package:flutter/material.dart';
import 'package:test_app_v2/src/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/example/design_pattern/design_pattern_page.dart';

class ExamplePage extends StatelessWidget {
  static const String routeName = '/ExamplePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExamplePage'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'DesignPatternPage', navigationWidget: DesignPatternPage()),
          ],
        ),
      ),
    );
  }
}
