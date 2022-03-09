import 'package:flutter/material.dart';

////////////////{ ref : https://santosenoque.medium.com/flutter-explicit-animations-master-flutter-animations-part-2-101b0b392250 } ////////////////
class CarAnimationPage extends StatefulWidget {
  static const String routeName = '/CarAnimationPage';
  @override
  _CarAnimationPageState createState() => _CarAnimationPageState();
}

class _CarAnimationPageState extends State<CarAnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 1), lowerBound: 0, upperBound: 400);

    // adding a listener
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: EdgeInsetsDirectional.only(end: controller.value),
              child: Text('🚗', style: TextStyle(fontSize: 70)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.forward();
                    },
                    child: Text('Forward')),
                ElevatedButton(
                    onPressed: () {
                      controller.stop();
                    },
                    child: Text('Stop')),
                ElevatedButton(
                    onPressed: () {
                      controller.reverse();
                    },
                    child: Text('Reverse')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.repeat(reverse: true);
                    },
                    child: Text('Loop')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
