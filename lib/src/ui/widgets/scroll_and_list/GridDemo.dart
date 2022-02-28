import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 3,
        child: Scaffold(
            appBar: AppBar(
                title: Text('Grid Demo'),
                bottom: TabBar(
                  // indicator: ShapeDecoration(
                  //   shape: StadiumBorder(
                  //     side: BorderSide(width: 5.0, color: Colors.green),
                  //   ),
                  //   //     shape: RoundedRectangleBorder(
                  //   //   side: BorderSide(width: 5.0, color: Colors.green),
                  //   //   borderRadius: BorderRadius.circular(10),
                  //   // ),
                  // ),
                  // indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.greenAccent, width: 5.0)),
                  // indicator: CircleTabIndicator(color: Colors.red, radius: 6),
                  indicator: BoxDecoration(
                    color: Colors.purple.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: const [
                    Tab(
                      text: 'GridView',
                    ),
                    Tab(
                      child: Text('GridView.Count'),
                    ),
                    Tab(
                      text: 'GridView.builder',
                    ),
                    Tab(
                      text: 'GridView.custom',
                    ),
                    Tab(
                      text: 'GridView.extent',
                    ),
                  ],
                  isScrollable: true,
                )),
            body: TabBarView(children: [
              GridView(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
                children: List.generate(100, (index) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: GridTile(
                        footer: Text(
                          'Item $index',
                          textAlign: TextAlign.center,
                        ),
                        header: Text(
                          'SubItem $index',
                          textAlign: TextAlign.center,
                        ),
                        child: Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
                      ),
                    ),
                    color: Colors.blueGrey[400],
                    margin: EdgeInsets.all(1.0),
                  );
                }),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(100, (index) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),
                          child: Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
                        ),
                      ),
                      color: Colors.blue[400],
                      margin: EdgeInsets.all(1.0),
                    );
                  })),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  //if (index < 50)
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: GridTile(
                        footer: Text(
                          'Item $index',
                          textAlign: TextAlign.center,
                        ),
                        header: Text(
                          'SubItem $index',
                          textAlign: TextAlign.center,
                        ),
                        child: Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
                      ),
                    ),
                    color: Colors.blue[400],
                    margin: EdgeInsets.all(1.0),
                  );
                },
              ),
              GridView.custom(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  childrenDelegate: SliverChildListDelegate(List.generate(100, (index) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),
                          child: Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
                        ),
                      ),
                      color: Colors.blue[400],
                      margin: EdgeInsets.all(1.0),
                    );
                  }))),
              GridView.extent(
                maxCrossAxisExtent: 200.0,
                children: List.generate(100, (index) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: GridTile(
                        footer: Text(
                          'Item $index',
                          textAlign: TextAlign.center,
                        ),
                        header: Text(
                          'SubItem $index',
                          textAlign: TextAlign.center,
                        ),
                        child: Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
                      ),
                    ),
                    color: Colors.blue[400],
                    margin: EdgeInsets.all(1.0),
                  );
                }),
              )
            ])));
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }

  void onChanged() {}
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
