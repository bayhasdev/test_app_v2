import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScrollViewMethod extends StatefulWidget {
  static const String routeName = '/CustomScrollViewMethod';
  @override
  _CustomScrollViewMethodState createState() => _CustomScrollViewMethodState();
}

class _CustomScrollViewMethodState extends State<CustomScrollViewMethod> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      // Set to set StatusBar color in iOS
      // To use TabBar, etc., it must be wrapped in Scaffold or Meterial.
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text("Flutter Shopping App", style: TextStyle(color: Colors.black)),
                ),
                const SliverPersistentHeader(pinned: true, delegate: TabBarDelegate()),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: TabBarView(
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(height: 400, color: Colors.grey),
                          ),
                          SliverPersistentHeader(pinned: true, delegate: CategoryBreadcrumbs()),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => Container(
                                      height: 40,
                                      // For fun viewing, multiply the index by any number and then  divide by 255 // to show different colors.
                                      color: Color.fromRGBO((index * 45) % 255, (index * 70) % 255, (index * 25), 1.0),
                                    ),
                                childCount: 40),
                          )
                        ],
                      ),
                      Container(color: Colors.redAccent),
                      Container(color: Colors.blue),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "홈",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "특가",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "랭킹",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CategoryBreadcrumbs extends SliverPersistentHeaderDelegate {
  const CategoryBreadcrumbs();
  final double height = 48;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text("clothing", style: TextStyle(color: Colors.black)),
          const SizedBox(width: 4),
          const Text(">", style: TextStyle(color: Colors.black)),
          const SizedBox(width: 4),
          const Text("all", style: TextStyle(color: Colors.black)),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Center(child: Text("View all")),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
