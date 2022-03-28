import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design/bottom_navigation/fancy_tab_bar/fancy_tab_bar_page.dart';
import 'package:test_app_v2/src/ui/design/bottom_navigation/notched_bottom_app_bar.dart';

class BottomNavigationIndex extends StatelessWidget {
  static const String routeName = '/BottomNavigationIndex';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'FancyTabBarPage', navigationWidget: FancyTabBarPage()),
            ListViewSingleItem(title: 'Notched Bottom AppBar', navigationWidget: NotchedBottomAppBar()),
          ],
        ),
      ),
    );
  }
}
