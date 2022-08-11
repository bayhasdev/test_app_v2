import 'package:flutter/material.dart';

class ShapeCollectionPage extends StatefulWidget {
  @override
  _ShapeCollectionPageState createState() => _ShapeCollectionPageState();
}

class _ShapeCollectionPageState extends State<ShapeCollectionPage> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.redAccent,
                elevation: 16.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(46.0),
                    bottomLeft: Radius.circular(46),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('BeveledRectangleBorder'),
                ),
              ),
              Material(
                color: Colors.redAccent,
                elevation: 16.0,
                shape: CircleBorder(side: BorderSide(color: Colors.black, width: 5)),
                child: Padding(
                  padding: const EdgeInsets.all(43.0),
                  child: Text('CircleBorder'),
                ),
              ),
              Row(
                children: const <Widget>[
                  Flexible(
                    child: Material(
                      color: Colors.redAccent,
                      elevation: 16.0,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(0.0), end: Radius.circular(190.0))),
                      child: Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Text('ContinuousRectangleBorder'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Material(
                      color: Colors.redAccent,
                      elevation: 16.0,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(0.0), bottom: Radius.circular(190.0))),
                      child: Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Text('ContinuousRectangleBorder'),
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                color: Colors.redAccent,
                elevation: 16.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0.0), bottom: Radius.circular(190.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Text('RoundedRectangleBorder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
