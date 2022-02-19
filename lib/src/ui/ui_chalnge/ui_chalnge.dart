// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UIChalnage extends StatefulWidget {
  static const String routeName = '/UIChalnage';
  @override
  _UIChalnageState createState() => _UIChalnageState();
}

class _UIChalnageState extends State<UIChalnage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Chalnage'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [],
        ),
      ),
    );
  }
}
