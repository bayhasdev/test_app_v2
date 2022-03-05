import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/design/animation/hero/hero_widget.dart';
import 'package:test_app_v2/src/utilities/constants.dart';

class Hero2Page extends StatelessWidget {
  static const String routeName = '/Hero2Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero2 Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Hero(tag: 'simpleHero1', child: Image.asset(kAssetsImageBase + 'gallery3.jpg')),
            const SizedBox(height: 16),
            HeroWidget(
              heroTag: 'flightShuttleBuilderHero',
              builder: (context) {
                return Image.asset(kAssetsImageBase + 'gallery3.jpg');
              },
            ),
          ],
        ),
      ),
    );
  }
}
