import 'package:flutter/material.dart';
import 'package:test_app_v2/src/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/forms/_forms_index.dart';
import 'package:test_app_v2/src/ui/widgets/overlay_example/OverlayIndex.dart';

// ignore: use_key_in_widget_constructors
class WidgetsPage extends StatefulWidget {
  static const String routeName = '/WidgetsPage';
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'Forms and inputs Page', navigationWidget: FormIndexPage()),
            ListViewSingleItem(title: 'OverlayOverSecreens', navigationWidget: OverlayIndex()),
          ],
        ),
      ),
    );
  }
}
