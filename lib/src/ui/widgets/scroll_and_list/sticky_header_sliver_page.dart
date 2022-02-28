import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StickyHeaderSliverPage extends StatefulWidget {
  @override
  _StickyHeaderSliverPageState createState() => _StickyHeaderSliverPageState();
}

class _StickyHeaderSliverPageState extends State<StickyHeaderSliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Sliver Page'),
      ),
      body: CustomScrollView(
        slivers: [
          ...List<int>.generate(5, (index) => index).map(
            (e) => SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text(e.toString(), style: TextStyle(fontSize: 88))),
              ),
            ),
          ),
          StickySliver(
            child: Container(
              height: 40,
              color: Colors.purple,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text('HEADER', style: TextStyle(fontSize: 32))),
            ),
          ),
          ...List<int>.generate(5, (index) => index).map(
            (e) => SliverToBoxAdapter(
              child: Container(
                height: 300,
                color: Colors.amber,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(child: Text(e.toString(), style: TextStyle(fontSize: 88))),
              ),
            ),
          ),
          StickySliver(
            child: Container(
              height: 40,
              color: Colors.purple,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text('HEADER2', style: TextStyle(fontSize: 32))),
            ),
          ),
          ...List<int>.generate(5, (index) => index).map(
            (e) => SliverToBoxAdapter(
              child: Container(
                height: 300,
                color: Colors.amber,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(child: Text(e.toString(), style: TextStyle(fontSize: 88))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RenderStickySliver extends RenderSliverSingleBoxAdapter {
  RenderStickySliver({required RenderBox child}) : super(child: child);

  @override
  void performLayout() {
    // var myCurrentConstraints = constraints;

    geometry = SliverGeometry.zero;

    child?.layout(
      constraints.asBoxConstraints(),
      parentUsesSize: true,
    );

    double childExtent = child!.size.height;

    geometry = SliverGeometry(
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
      paintOrigin: constraints.scrollOffset,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}

class StickySliver extends SingleChildRenderObjectWidget {
  const StickySliver({required Widget child, Key? key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStickySliver(child: RenderErrorBox('sdfsdfsd'));
  }
}
