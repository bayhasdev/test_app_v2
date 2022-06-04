import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RadioSliderPage extends StatelessWidget {
  static const String routeName = '/RadioSliderPage';
  const RadioSliderPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Slider Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            RadioSlider1(),
          ],
        ),
      ),
    );
  }
}

class RadioSlider1 extends StatefulWidget {
  const RadioSlider1();
  @override
  _RadioSlider1State createState() => _RadioSlider1State();
}

class _RadioSlider1State extends State<RadioSlider1> {
  List<MeasurementModel> measurementList = getMeasurementList();
  final double pointerDimention = 20;
  late int selectedIndex = measurementList.length ~/ 2;

  @override
  void initState() {
    super.initState();
    selectedIndex = measurementList.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade200,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text('$selectedIndex')),
          SizedBox(height: 8),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CarouselSlider.builder(
                  itemCount: measurementList.length,
                  itemBuilder: (context, index, idx) {
                    return _singleItem(index);
                  },
                  options: CarouselOptions(
                    height: 80,
                    aspectRatio: 0,
                    initialPage: measurementList.length ~/ 2,
                    viewportFraction: 0.03,
                    enableInfiniteScroll: false,
                    pageSnapping: true,
                    onPageChanged: (index, carouselPageChangedReason) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
              CustomPaint(
                painter: TraingleShapeDown(background: Colors.black54),
                size: Size(15, 35.5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _singleItem(int index) {
    final MeasurementModel item = measurementList[index];
    double width = 2, height = 15;

    Color color = Colors.grey.shade400;
    if (index % 5 == 0) {
      color = Colors.black54;
      height = 20;
    }
    var differnce = (selectedIndex - index).abs();
    if (differnce > 7) {
      double opacity = 0.2;
      log('$index : $selectedIndex | $differnce | $opacity');
      if (differnce < 13) {
        opacity = 0.5;
      } else if (differnce < 17) {
        color = color.withOpacity(0.4);
      } else if (differnce < 23) {
        color = color.withOpacity(0.3);
      }
      if (index % 5 == 0) {
        opacity = opacity * 0.3;
      }

      color = color.withOpacity(opacity);
    }
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(alignment: Alignment.bottomCenter, height: 20, child: Container(width: width, height: height, color: color)),
        if (item.title != null) ...[
          Positioned(
            top: 35,
            child: Text(
              item.title.toString(),
              style: TextStyle(color: color),
            ),
          ),
          Positioned(
            top: 25,
            child: CustomPaint(
              painter: TraingleShapeUp(background: color),
              size: Size(10, 10),
            ),
          ),
        ],
      ],
    );
  }
}

class MeasurementModel {
  int? id;
  double? value;
  String? title;
  MeasurementModel({this.id, this.value, this.title});
}

List<MeasurementModel> getMeasurementList() {
  return List.generate(30, (index) => MeasurementModel(id: index, value: index.toDouble(), title: index % 10 == 0 ? 'index : $index' : null));
}

class TraingleShapeDown extends CustomPainter {
  final Color background;
  TraingleShapeDown({this.background = Colors.black});
  @override
  void paint(Canvas canvas, Size size) {
    double traingleHeight = size.height * 0.35;
    var painter = Paint()
      ..color = background
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    var path = Path();
    path.lineTo(size.width / 2, traingleHeight);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.moveTo(size.width / 2, traingleHeight);
    // path.moveTo(size.width / 2, 0);
    // path.lineTo(0, size.height);
    // path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
    canvas.drawLine(Offset(size.width / 2, traingleHeight * 0.8), Offset(size.width / 2, size.height), painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TraingleShapeUp extends CustomPainter {
  final Color background;
  TraingleShapeUp({this.background = Colors.black});
  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = background
      ..style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
