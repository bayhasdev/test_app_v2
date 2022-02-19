import 'package:flutter/material.dart';
import 'package:test_app_v2/src/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design_page.dart';
import 'package:test_app_v2/src/ui/ui_chalnge.dart';
import 'package:test_app_v2/src/ui/widgets_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/MainPage';

  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test App'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'widgets', navigationWidget: WidgetsPage()),
            ListViewSingleItem(title: 'Desig Page', navigationWidget: DesigPage()),
            ListViewSingleItem(title: 'UI Chalnage', navigationWidget: UIChalnage()),
          ],
        ),
      ),
    );
  }
}
