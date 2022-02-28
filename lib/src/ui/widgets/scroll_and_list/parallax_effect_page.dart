import 'package:flutter/material.dart';

class ParallaxEffectPage extends StatefulWidget {
  static const String routeName = '/ParallaxEffectPage';
  @override
  _ParallaxEffectPageState createState() => _ParallaxEffectPageState();
}

class _ParallaxEffectPageState extends State<ParallaxEffectPage> {
  late Size size;
  double imageOffset = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Parallax Effect Page'),
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              setState(() => imageOffset = notification.metrics.pixels);
              return true;
            },
            child: Stack(
              children: [
                Positioned(
                    top: -0.25 * imageOffset, child: Image.asset('assets/images/youtube_two.jpg', width: size.width, height: 230, fit: BoxFit.fill)),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(height: 230, color: Colors.transparent),
                      Container(height: 200, color: Colors.red),
                      Container(height: 200, color: Colors.black),
                      Container(height: 200, color: Colors.orange),
                      Container(height: 200, color: Colors.black),
                      Container(height: 200, color: Colors.orange),
                      Column(
                        children: [
                          Container(height: 200, color: Colors.green),
                          Container(height: 200, color: Colors.black38),
                          Container(height: 200, color: Colors.orange),
                          Container(height: 200, color: Colors.black),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
