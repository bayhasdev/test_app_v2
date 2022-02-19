import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class WidgetsPage extends StatefulWidget {
  static const String routeName = '/WidgetsPage';
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Page'),
      ),
      body: SafeArea(child: Container()),
    );
  }
}
