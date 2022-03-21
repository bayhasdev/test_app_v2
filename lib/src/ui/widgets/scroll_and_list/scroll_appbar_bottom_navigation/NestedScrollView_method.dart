import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/scroll_appbar_bottom_navigation/CustomScrollView_method.dart';

class NestedScrollViewMethod extends StatefulWidget {
  static const String routeName = '/NestedScrollViewMethod';
  @override
  _NestedScrollViewMethodState createState() => _NestedScrollViewMethodState();
}

class _NestedScrollViewMethodState extends State<NestedScrollViewMethod> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      // Set to set StatusBar color in iOS
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    toolbarHeight: 48,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: const Text("Flutter Shopping App", style: TextStyle(color: Colors.black)),
                  ),
                  // 변경사항
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: const SliverPersistentHeader(pinned: true, delegate: TabBarDelegate()),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  const FirstTabScreen(),
                  Container(color: Colors.redAccent),
                  Container(color: Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// 변경사항
    return Column(
      children: [
        const SizedBox(height: 48),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  color: Colors.grey,
                ),
              ),
              const SliverPersistentHeader(pinned: true, delegate: CategoryBreadcrumbs()),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          height: 40,
                          color: Color.fromRGBO((index * 45) % 255, (index * 70) % 255, (index * 25), 1.0),
                        ),
                    childCount: 40),
              )
            ],
          ),
        ),
      ],
    );
  }
}
