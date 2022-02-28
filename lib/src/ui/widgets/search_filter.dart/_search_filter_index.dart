import 'package:flutter/material.dart';
import 'package:test_app_v2/src/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/search_filter.dart/listViewFilterPage.dart';

class SearchFilterIndex extends StatelessWidget {
  static const String routeName = '/SearchFilterIndex';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter Index'),
      ),
      body: SafeArea(
        child: ListView(children: [
          ////////////////{ filter List View } ////////////////
          ListViewSectionHeader(title: 'filter List View'),
          ListViewSingleItem(title: 'ListView Filter ', navigationWidget: ListViewFilterPage()),
        ]),
      ),
    );
  }
}
