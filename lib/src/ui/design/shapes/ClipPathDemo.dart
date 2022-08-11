import 'package:flutter/material.dart';

class ClipPathDemo extends StatelessWidget {
  ///////////////////{ https://medium.com/flutter-community/flutter-custom-clipper-28c6d380fdd6 } ////////////////
  ///////////////////{ https://medium.com/flutter-community/playing-with-paths-in-flutter-97198ba046c8 } ////////////////
  ///////////////////{ https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0 } ////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipPathDemo 1'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Container(
                height: 64,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: MessageBorder(),
                    shadows: const [BoxShadow(color: Colors.black, blurRadius: 4.0, offset: Offset(2, 2))]),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8),
                child: Container(width: 30, decoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle)),
              ),
              SizedBox(height: 20),
              Container(
                decoration: ShapeDecoration(
                  shape: MessageBorder(usePadding: false),
                  shadows: const [
                    BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(2, 2)),
                  ],
                ),
                child: Material(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: MessageBorder(),
                  child: InkWell(
                    splashColor: Colors.orange,
                    hoverColor: Colors.blueGrey,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(height: 64, padding: EdgeInsets.only(bottom: 20, right: 8)),
                  ),
                ),
              ),
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(image: AssetImage('assets/images/virus.png')),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: ClipPath(
                  clipper: MyClipPath2(),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: AssetImage('assets/images/virus.png'))),
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  height: 100,
                  width: 130,
                  decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: AssetImage('assets/images/wear_mask.png'))),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 100,
                  width: 130,
                  decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: AssetImage('assets/images/wear_mask.png'))),
                ),
              ),
              ClipPath(
                clipper: ArcToPointClipPath(),
                child: Container(width: 300, height: 200, color: Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBorder extends ShapeBorder {
  ////////////////{ https://stackoverflow.com/questions/57942533/flutter-clippath } ////////////////
  final bool usePadding;

  const MessageBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
      ..moveTo(rect.bottomCenter.dx - 80, rect.bottomCenter.dy)
      ..relativeLineTo(10, 25)
      ..relativeQuadraticBezierTo(5, 5, 10, 0)
      ..relativeLineTo(30, -25)
      ..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
      ..moveTo(rect.bottomCenter.dx - 80, rect.bottomCenter.dy)
      ..relativeLineTo(10, 25)
      ..relativeQuadraticBezierTo(5, 5, 10, 0)
      ..relativeLineTo(30, -25)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.500)
      ..quadraticBezierTo(size.width * 0.25, size.height, size.width / 2, size.height * 0.550)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.250, size.width, size.height * 0.550)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(MyClipPath oldClipper) => true;
}

class MyClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 3);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipPath2 oldClipper) => false;
}

class ArcToPointClipPath extends CustomClipper<Path> {
  ////////////////{ https://www.developerlibs.com/2019/08/flutter-draw-custom-shaps-clip-path.html } ////////////////
  @override
  Path getClip(Size size) {
    double radius = 40;

    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius))
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius))
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false)
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.elliptical(radius, radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(ArcToPointClipPath oldClipper) => false;
}
