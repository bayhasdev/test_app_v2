import 'package:flutter/material.dart';
import 'package:test_app_v2/src/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/GridDemo.dart';

class ScrollAndListIndex extends StatelessWidget {
  static const String routeName = '/ScrollAndListPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll And List Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'GridViewDemo', navigationWidget: GridViewDemo()),
          ],
        ),
      ),
    );
  }
}
