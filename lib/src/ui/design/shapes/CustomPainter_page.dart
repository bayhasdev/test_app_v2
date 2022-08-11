import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:math' as math;

class CustomPainterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Painter Example'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: CustomPaint(
          //size: Size(size.width, size.height),
          painter: CurvePainter(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.deepPurple[100],
                      child: CustomPaint(
                        painter: CirclePainter(),
                      ),
                    ),
                    Container(
                      //@smaile
                      width: 100,
                      height: 100,
                      child: CustomPaint(
                        painter: FacePainter(),
                      ),
                    ),
                    Container(
                      child: CustomPaint(
                        size: Size(130, 200), //You can Replace this with your desired WIDTH and HEIGHT
                        painter: BCustomPainter(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
                      child: CustomPaint(
                        size: Size(150, 150), //You can Replace this with your desired WIDTH and HEIGHT
                        painter: FlutterShapeMaker(),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                      child: CustomPaint(
                        child: Container(),
                        painter: ParticlePainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    Paint paint = Paint();
    paint.color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);

    var smilePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), 0, pi, false, smilePaint);

    //drow eyes
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 2), 5, Paint());
    canvas.drawCircle(Offset(center.dx + radius / 2, center.dy - radius / 2), 5, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.deepPurple;
    // paint.style = PaintingStyle.stroke; // Change this to fill
    // paint.strokeWidth = 5;

    var path = Path();

    path.moveTo(size.width / 2, size.height * 0.5);

    canvas.drawCircle(Offset(size.width / 2, size.height * 0.5), 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.purple;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, size.height * 0.50, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

////////////////{ https://blog.usejournal.com/how-to-draw-custom-shapes-in-flutter-aa197bda94bf } ////////////////
    paint = Paint();
    paint.color = Colors.purple;
    paint.style = PaintingStyle.fill;

    path = Path();
    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875, size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584, size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BCustomPainter extends CustomPainter {
  ////////////////{ ref : https://www.youtube.com/watch?v=AnKgtKxRLX4&feature=youtu.be&ab_channel=RetroPortalStudio } ////////////////
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width * 0.01, 0);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.01, size.width * 0.45, size.height * 0.50);
    path.cubicTo(size.width * 0.98, size.height * 0.99, size.width * 0.11, size.height * 1.00, size.width * 0.01, size.height * 1.00);
    path.quadraticBezierTo(size.width * 0.23, size.height * 0.45, size.width * 0.01, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class FlutterShapeMaker extends CustomPainter {
  ////////////////{ ref : https://www.youtube.com/watch?v=AnKgtKxRLX4&feature=youtu.be&ab_channel=RetroPortalStudio } ////////////////

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width * 0.47, size.height * 0.13);
    path.lineTo(size.width * 0.27, size.height * 0.33);
    path.lineTo(size.width * 0.39, size.height * 0.46);
    path.lineTo(size.width * 0.53, size.height * 0.33);
    path.lineTo(size.width * 0.60, size.height * 0.40);
    path.lineTo(size.width * 0.46, size.height * 0.53);
    path.lineTo(size.width * 0.73, size.height * 0.80);
    path.lineTo(size.width * 0.67, size.height * 0.86);
    path.lineTo(size.width * 0.20, size.height * 0.40);
    path.lineTo(size.width * 0.13, size.height * 0.33);
    path.lineTo(size.width * 0.40, size.height * 0.07);
    path.lineTo(size.width * 0.47, size.height * 0.13);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ParticlePainter extends CustomPainter {
  // final List<GameObject> objects;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    const degrees = 120;
    const radians = degrees * math.pi / 180;

    canvas.rotate(radians);

    canvas.drawRect(
        Rect.fromCenter(
          height: 20,
          width: 20,
          center: Offset(
            0.0,
            0.0,
          ),
        ),
        Paint()
          ..color = Colors.red
          ..blendMode = BlendMode.darken);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  // ParticlePainter(this.objects);
}
