import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/scroll_appbar_bottom_navigation/CustomScrollView_method.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/scroll_appbar_bottom_navigation/NestedScrollView_method.dart';

////////////////{ ref : https://honor-driven.dev/flutter%EB%A1%9C-shopping-%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B0-3-nestedscrollview-cec18854f859 } ////////////////
class ScrollAppbarBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text('Scroll with Appbar And BottomNavigation')),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'CustomScrollView Method', navigationWidget: CustomScrollViewMethod()),
            ListViewSingleItem(title: 'NestedScrollView Method', navigationWidget: NestedScrollViewMethod()),
          ],
        ),
      ),
    );
  }
}
