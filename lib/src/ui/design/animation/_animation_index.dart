import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design/animation/car_an%C4%B1mat%C4%B1on_page.dart';
import 'package:test_app_v2/src/ui/design/animation/hero/hero_page.dart';
import 'package:test_app_v2/src/ui/design/animation/switch_elements.dart';

class AnimationIndex extends StatelessWidget {
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
            ListViewSectionHeader(title: 'Transitions & navigation'),
            ListViewSingleItem(title: 'Hero ', navigationWidget: HeroPage()),
            ListViewSingleItem(title: 'Car Animation ', navigationWidget: CarAnimationPage()),
            ListViewSingleItem(title: 'Switch Elements ', navigationWidget: SwitchElements()),
          ],
        ),
      ),
    );
  }
}
