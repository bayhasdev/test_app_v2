import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/design/animation/hero/hero1_page.dart';
import 'package:test_app_v2/src/ui/design/animation/hero/hero_widget.dart';
import 'package:test_app_v2/src/utilities/constants.dart';

////////////////{ ref : https://www.youtube.com/watch?v=JgtHhMYFR2A&t=10s&ab_channel=Himdevedevelopment } ////////////////
class HeroPage extends StatefulWidget {
  static const String routeName = '/HeroAnimation1Page';
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  Widget image = Image.asset(kAssetsImageBase + 'gallery3.jpg');
  @override
  Widget build(BuildContext context) {
    // timeDilation = 0.1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Page'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _simpleHero(),
            const SizedBox(height: 16),
            _heroRotationTransition(),
          ],
        ),
      ),
    );
  }

  Widget _simpleHero() {
    return ListTile(
      title: Text('simpleHero1'),
      leading: Hero(tag: 'simpleHero1', child: Image.asset(kAssetsImageBase + 'gallery3.jpg')),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Hero2Page())),
    );
  }

  Widget _heroRotationTransition() {
    return ListTile(
      title: Text('Hero rotationTransition'),
      leading: HeroWidget(heroTag: 'flightShuttleBuilderHero', builder: (context) => image),
      onTap: onTap,
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Hero2Page())),
    );
  }

  void onTap() {
    Navigator.of(context).push(
      PageRouteBuilder(
        reverseTransitionDuration: Duration(seconds: 1),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0.1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.ease)).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.ease)).animate(animation),
              child: child,
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return Hero2Page();
        },
      ),
    );
  }
}
