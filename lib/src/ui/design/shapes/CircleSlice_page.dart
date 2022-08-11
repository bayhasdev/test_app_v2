import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleSlicesWidget extends StatefulWidget {
  static const String routeName = '/CircleSlicePage';
  @override
  _CircleSlicesWidgetState createState() => _CircleSlicesWidgetState();
}

class _CircleSlicesWidgetState extends State<CircleSlicesWidget> {
  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.indigo,
      Colors.deepOrange,
      Colors.green,
    ];
    double anglePerSlice = 2 * math.pi / colors.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Circle Slices Widget', style: TextStyle(fontSize: 18)),
          SizedBox(height: 70),
          Container(
            height: 70,
            width: 70,
            child: Stack(
              fit: StackFit.expand,
              children: [
                for (int i = 0; i < colors.length; i++)
                  Transform.rotate(
                    angle: i * anglePerSlice,
                    alignment: Alignment.topLeft,
                    child: CustomPaint(
                      painter: CircleSlicePainter(
                        anglePerSlice,
                        colors[i],
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Path buildSlicePath(double radius, double angle) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(radius, 0)
      ..arcTo(
        Rect.fromCircle(center: Offset(0, 0), radius: radius),
        0,
        angle,
        false,
      )
      ..close();
  }
}

class CircleSlicePainter extends CustomPainter {
  final double angle;
  final Color color;

  const CircleSlicePainter(this.angle, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height);
    final path = buildSlicePath(radius, angle);
    canvas.drawPath(path, Paint()..color = color);
  }

  Path buildSlicePath(double radius, double angle) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(radius, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(0, 0),
          radius: radius,
        ),
        0,
        angle,
        false,
      )
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
