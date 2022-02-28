import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListViewWithFooterPage extends StatefulWidget {
  static const String routeName = '/ListViewWithFooterPage';
  @override
  _ListViewWithFooterPageState createState() => _ListViewWithFooterPageState();
}

class _ListViewWithFooterPageState extends State<ListViewWithFooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewWithFooterPage'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            ////////////////{ Method one } ////////////////
            // return CustomScrollView(
            //   slivers: <Widget>[
            //     SliverFixedExtentList(
            //       itemExtent: 142.0,
            //       delegate: SliverChildBuilderDelegate((context, index) {
            //         return SizedBox.expand(child: Card(color: Colors.cyan));
            //       }, childCount: 2),
            //     ),
            //     SliverFooter(
            //       child: Align(
            //         alignment: Alignment.bottomCenter,
            //         child: Container(
            //           height: 42.0,
            //           width: double.infinity,
            //           color: Colors.red,
            //           alignment: Alignment.center,
            //           child: Text('FOOTER'),
            //         ),
            //       ),
            //     ),
            //   ],
            // );

            ////////////////{ method tow } ////////////////
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(height: 200, color: Colors.blue),
                      Container(height: 200, color: Colors.orange),
                      // Container(height: 200, color: Colors.green),
                      // Container(height: 150, color: Colors.pink),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            color: Colors.red,
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'FOOTER',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SliverFooter extends SingleChildRenderObjectWidget {
  /// Creates a sliver that fills the remaining space in the viewport.
  const SliverFooter({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderSliverFooter createRenderObject(BuildContext context) => RenderSliverFooter();
}

class RenderSliverFooter extends RenderSliverSingleBoxAdapter {
  /// Creates a [RenderSliver] that wraps a [RenderBox] which is sized to fit
  /// the remaining space in the viewport.
  RenderSliverFooter({
    RenderBox? child,
  }) : super(child: child);

  @override
  void performLayout() {
    final extent = constraints.remainingPaintExtent - math.min(constraints.overlap, 0.0);
    var childGrowthSize = .0; // added
    if (child != null) {
      // changed maxExtent from 'extent' to double.infinity
      child!.layout(constraints.asBoxConstraints(minExtent: extent, maxExtent: double.infinity), parentUsesSize: true);
      childGrowthSize = constraints.axis == Axis.vertical ? child!.size.height : child!.size.width; // added
    }
    final paintedChildSize = calculatePaintOffset(constraints, from: 0.0, to: extent);
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      // used to be this : scrollExtent: constraints.viewportMainAxisExtent,
      scrollExtent: math.max(extent, childGrowthSize),
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      hasVisualOverflow: extent > constraints.remainingPaintExtent || constraints.scrollOffset > 0.0,
    );
    if (child != null) {
      setChildParentData(child!, constraints, geometry!);
    }
  }
}
