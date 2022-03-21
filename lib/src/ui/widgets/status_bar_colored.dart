import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarColored extends StatelessWidget {
  static const String routeName = '/StatusBarColored';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(children: [
          Expanded(child: Container(color: Colors.amber)),
          Expanded(child: Container(color: Colors.blue)),
        ]),
      ),
    );
  }
}
