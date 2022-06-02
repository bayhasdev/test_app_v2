import 'package:flutter/material.dart';

class ErrorWidgets {
  Widget materialErrorWidget(FlutterErrorDetails details) {
    return Material(
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      color: Colors.green,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Text(
              details.exception.toString(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
