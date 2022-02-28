import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';

class WallLayoutPage extends StatefulWidget {
  static const String routeName = '/WallLayoutPage';
  @override
  _WallLayoutPageState createState() => _WallLayoutPageState();
}

class _WallLayoutPageState extends State<WallLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wall layout'),
      ),
      body: SafeArea(
        child: WallLayout(
          stones: _buildStonesList(),
          layersCount: 3,
          scrollDirection: Axis.vertical,
          reverse: false,
        ),
      ),
    );
  }

  List<Stone> _buildStonesList() {
    return [
      Stone(id: 0, width: 2, height: 2, child: Container(color: Colors.red, child: Center(child: Text("2x2")))),
      Stone(id: 1, width: 1, height: 3, child: Container(color: Colors.teal, child: Center(child: Text("2x2")))),
      Stone(id: 2, width: 2, height: 2, child: Container(color: Colors.amber, child: Center(child: Text("2x2")))),
      Stone(id: 3, width: 1, height: 1, child: Container(color: Colors.black54, child: Center(child: Text("2x2")))),
      Stone(id: 4, width: 3, height: 2, child: Container(color: Colors.blue, child: Center(child: Text("2x2")))),
      Stone(id: 5, width: 1, height: 1, child: Container(color: Colors.cyan, child: Center(child: Text("2x2")))),
    ];
  }
}

class WallLayoutFull extends StatefulWidget {
  @override
  _WallLayoutFullState createState() => _WallLayoutFullState();
}

class _WallLayoutFullState extends State<WallLayoutFull> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _reversed = false;
  Axis _direction = Axis.vertical;
  int _nbLayers = 3;
  bool _wrapedOptions = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).backgroundColor;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text('Wall Layout Full')),
      body: buildWallLayout(),
      floatingActionButton: _buildOptions(context),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(left: 32),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6.0),
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!_wrapedOptions)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    __buildDivisionsOption(),
                    __buildDirectionOption(),
                    __buildReverseOption(),
                  ],
                ),
              ),
            FloatingActionButton(
              elevation: 0.0,
              highlightElevation: 0.0,
              onPressed: () => setState(() => _wrapedOptions = !_wrapedOptions),
              child: Icon(Icons.build),
            ),
          ],
        ),
      ),
    );
  }

  Widget __buildDivisionsOption() {
    return _buildOption(
      "Layers",
      CupertinoSegmentedControl(
        groupValue: _nbLayers,
        children: const {2: Text("2"), 3: Text("3"), 4: Text("4")},
        onValueChanged: (int? value) => setState(() {
          _controller.forward(from: 0.0);
          _nbLayers = value ?? 00;
        }),
      ),
    );
  }

  Widget __buildReverseOption() {
    return _buildOption(
      "Reverse",
      CupertinoSegmentedControl(
        groupValue: _reversed,
        children: const {false: Text("no"), true: Text("yes")},
        onValueChanged: (bool value) => setState(() {
          _controller.forward(from: 0.0);
          _reversed = value;
        }),
      ),
    );
  }

  Widget __buildDirectionOption() {
    return _buildOption(
      "Direction",
      CupertinoSegmentedControl(
        groupValue: _direction,
        children: const {Axis.vertical: Text("vertical"), Axis.horizontal: Text("horizontal")},
        onValueChanged: (Axis value) => setState(() {
          _controller.forward(from: 0.0);
          _direction = value;
        }),
      ),
    );
  }

  Widget _buildOption(String text, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(text),
            flex: 1,
          ),
          Expanded(
            child: child,
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget buildWallLayout() {
    return WallLayout(
      scrollDirection: _direction,
      stones: _buildStonesList(),
      reverse: _reversed,
      layersCount: _nbLayers,
    );
  }

  List<Stone> _buildStonesList() {
    final List<Map> data = [
      {"color": Colors.red, "width": 2, "height": 2},
      {"color": Colors.greenAccent, "width": 1, "height": 1},
      {"color": Colors.lightBlue, "width": 1, "height": 2},
      {"color": Colors.purple, "width": 2, "height": 1},
      {"color": Colors.yellow, "width": 1, "height": 1},
      {"color": Colors.cyanAccent, "width": 1, "height": 1},
      {"color": Colors.orange, "width": 2, "height": 2},
      {"color": Colors.green, "width": 1, "height": 1},
      {"color": Colors.pink, "width": 2, "height": 1},
      {"color": Colors.blueAccent, "width": 1, "height": 1},
      {"color": Colors.amber, "width": 1, "height": 2},
      {"color": Colors.teal, "width": 2, "height": 1},
      {"color": Colors.lightGreenAccent, "width": 1, "height": 1},
      {"color": Colors.deepOrange, "width": 1, "height": 1},
      {"color": Colors.deepPurpleAccent, "width": 2, "height": 2},
      {"color": Colors.lightBlueAccent, "width": 1, "height": 1},
      {"color": Colors.limeAccent, "width": 1, "height": 1},
    ];
    return data.map((d) {
      int width = d["width"];
      int height = d["height"];
      return Stone(
        id: data.indexOf(d),
        width: width,
        height: height,
        child: __buildStoneChild(
          background: d["color"],
          text: "${width}x$height",
          surface: (width * height).toDouble(),
        ),
      );
    }).toList();
  }

  Widget __buildStoneChild({required Color background, required String text, required double surface}) {
    return ScaleTransition(
      scale: CurveTween(curve: Interval(0.0, min(1.0, 0.25 + surface / 6.0))).animate(_controller),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [background, Color.alphaBlend(background.withOpacity(0.6), Colors.black)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
    );
  }
}
