import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/NestedScrollViewWithParalleaxEffect.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/PaginatedListView.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/Stacked_Item_ListView.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/animated-lists-in-flutter.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/listview_with_footer.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/parallax_effect_page.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/relative_scroll/builder_method/relative_scroll_page.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/scroll_to_element.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/scrollable_positioned_list.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/section_list_demo.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/sticky_header_sliver_page.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/collapsing_header_list_page.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/GridDemo.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/wall_layout.dart';

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
            ////////////////{ Grids } ////////////////
            ListViewSectionHeader(title: 'Grids'),
            ListViewSingleItem(title: 'GridViewDemo', navigationWidget: GridViewDemo()),
            ListViewSingleItem(title: 'Wall Layout Page ', navigationWidget: WallLayoutFull()),

            ////////////////{ Collapsing and effects } ////////////////
            ListViewSectionHeader(title: 'Collapsing and effects'),
            ListViewSingleItem(title: 'Collapsing Header List', navigationWidget: CollapsingHeaderList()),
            ListViewSingleItem(title: 'NestedScrollViewWithParalleaxEffect', navigationWidget: NestedScrollViewWithParalleaxEffect()),
            ListViewSingleItem(title: 'Parallax Effect Page', navigationWidget: ParallaxEffectPage()),
            ListViewSingleItem(title: 'Stacked Item ListView ', navigationWidget: StackedItemListView()),
            ListViewSingleItem(title: 'Animated List ', navigationWidget: AnimatedListInFlutter()),

            ////////////////{ Section And Headers } ////////////////
            ListViewSectionHeader(title: 'Section And Headers'),
            ListViewSingleItem(title: 'relative scroll', navigationWidget: RelativeScrollBuilderPage()),
            ListViewSingleItem(title: 'Section List Demo', navigationWidget: SectionListDemo()),
            ListViewSingleItem(title: 'Sticky Header SliverPage', navigationWidget: StickyHeaderSliverPage()),
            ListViewSingleItem(title: 'ListView With Footer ', navigationWidget: ListViewWithFooterPage()),

            ////////////////{ Scrollable And Positioned } ////////////////
            ListViewSectionHeader(title: 'Scrollable And Positioned'),
            ListViewSingleItem(title: 'Scrollable Positioned List ', navigationWidget: ScrollablePositionedListWidget()),
            ListViewSingleItem(title: 'Scroll To Element ', navigationWidget: ScrollToElement()),
            ListViewSingleItem(title: 'PaginatedListView ', navigationWidget: PaginatedListView()),

            ////////////////{ Others } ////////////////
            ListViewSectionHeader(title: 'Others'),
          ],
        ),
      ),
    );
  }
}
