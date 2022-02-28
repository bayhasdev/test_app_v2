import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/design/bottom_navigation/fancy_tab_bar/fancy_tab_bar.dart';
import 'package:test_app_v2/src/ui/design/bottom_navigation/fancy_tab_bar/tab_item.dart';

////////////////{ ref : https://tonyowen.medium.com/flutter-bottom-tab-bar-animation-75d1ca58c096 } ////////////////
class FancyTabBarPage extends StatefulWidget {
  @override
  _FancyTabBarPageState createState() => _FancyTabBarPageState();
}

class _FancyTabBarPageState extends State<FancyTabBarPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: PURPLE,
        title: Text("Tab Bar Animation"),
      ),
      bottomNavigationBar: FancyTabBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
    );
  }
}
