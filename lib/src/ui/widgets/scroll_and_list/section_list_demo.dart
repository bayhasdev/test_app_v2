import 'package:flutter/material.dart';
import 'package:flutter_section_list/flutter_section_list.dart';

class SectionListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section List Demo'),
      ),
      body: SectionListView.builder(adapter: SectionListAdapter()),
    );
  }
}

class SectionListAdapter with SectionAdapterMixin {
  @override
  int numberOfSections() {
    return 10;
  }

  @override
  int numberOfItems(int section) {
    return 15;
  }

  @override
  Widget getItem(BuildContext context, IndexPath indexPath) {
    return ListTile(title: Text(indexPath.item.toString(), style: TextStyle(color: Colors.red)));
  }

  @override
  bool shouldExistSectionHeader(int section) {
    return true;
  }

  @override
  bool shouldSectionHeaderStick(int section) {
    return true;
  }

  @override
  bool shouldExistSectionFooter(int section) {
    return true;
  }

  @override
  Widget getSectionHeader(BuildContext context, int section) {
    return Card(child: ListTile(title: Text('Section Header $section', style: TextStyle(color: Colors.red))));
  }

  @override
  Widget getSectionFooter(BuildContext context, int section) {
    return Card(child: ListTile(title: Text('Section Footer $section', style: TextStyle(color: Colors.red))));
  }
}
