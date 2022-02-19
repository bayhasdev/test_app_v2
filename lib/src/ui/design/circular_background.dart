// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/global_var.dart';

class CircularBackgroundPage extends StatefulWidget {
  const CircularBackgroundPage();
  @override
  State createState() => _CircularBackgroundPageState();
}

class _CircularBackgroundPageState extends State<CircularBackgroundPage> {
  @override
  Widget build(BuildContext context) {
    GlobalVar.log('%%%%%%%%%% main page rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Flutter RepaintBoundary Demo'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(),
          const CursorPointerWidget(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    // her the expensive job
    return RepaintBoundary(
      child: CustomPaint(
        painter: BackgroundColor(MediaQuery.of(context).size),
        isComplex: true,
        willChange: false,
      ),
    );
  }
}

class BackgroundColor extends CustomPainter {
  static const List<Color> colors = [
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
  ];

  final Size _size;
  BackgroundColor(this._size);

  @override
  void paint(Canvas canvas, Size size) {
    GlobalVar.log('%%%%%%%%%% BackgroundColor repaint');
    final Random rand = Random(12345);

    for (int i = 0; i < 10000; i++) {
      canvas.drawOval(
          Rect.fromCenter(
            center: Offset(
              rand.nextDouble() * _size.width - 100,
              rand.nextDouble() * _size.height,
            ),
            width: rand.nextDouble() * rand.nextInt(150) + 200,
            height: rand.nextDouble() * rand.nextInt(150) + 200,
          ),
          Paint()..color = colors[rand.nextInt(colors.length)].withOpacity(0.3));
    }
  }

  @override
  bool shouldRepaint(BackgroundColor oldDelegate) => false;
}

class CursorPointer extends CustomPainter {
  final Offset _offset;

  CursorPointer(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      _offset,
      10.0,
      Paint()..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(CursorPointer oldDelegate) => oldDelegate._offset != _offset;
}

class CursorPointerWidget extends StatefulWidget {
  const CursorPointerWidget();
  @override
  _CursorPointerWidgetState createState() => _CursorPointerWidgetState();
}

class _CursorPointerWidgetState extends State<CursorPointerWidget> {
  final GlobalKey _paintKey = GlobalKey();
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    GlobalVar.log('%%%%%%%%%% CursorPointerWidget rebuild');
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        key: _paintKey,
        painter: CursorPointer(_offset),
        // child: ConstrainedBox(
        //   constraints: const BoxConstraints.expand(),
        // ),
      ),
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox? referenceBox = _paintKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() {
      _offset = offset;
    });
  }
}
