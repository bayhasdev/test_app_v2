import 'package:flutter/material.dart';

import 'StrategyPatternPage.dart';

class DesignPatternPage extends StatelessWidget {
  static const String routeName = '/DesignPatternPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design Patterns'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ElevatedButton(
              child: Text('Strategy Pattern Page '),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return StrategyPatternPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  List sort(List list) {
    list.sort((a, b) => (a['name']).compareTo(b['name']));
    return list;
  }
}
