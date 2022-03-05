import 'dart:math' as math;

import 'package:flutter/material.dart';

typedef HeroBuilder = Widget Function(BuildContext context);

class HeroWidget extends StatelessWidget {
  final HeroBuilder heroBuilder;
  final Object heroTag;
  final double? width;
  final VoidCallback? onTap;

  const HeroWidget({Key? key, required HeroBuilder builder, required this.heroTag, this.width, this.onTap})
      : heroBuilder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: heroTag,
        transitionOnUserGestures: true, // Making Hero animations work with iOS back swipe gestures
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: heroBuilder(context),
            onTap: onTap,
          ),
        ),

        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          // return RotationTransition(
          //   turns: Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease)).animate(animation),
          //   child: toHeroContext.widget as Hero..child,
          // );
          final Hero toHero = toHeroContext.widget as Hero;
          return ScaleTransition(
            scale: animation.drive(
              Tween<double>(begin: 0.0, end: 1.0).chain(
                CurveTween(
                  curve: Interval(0.0, 1.0, curve: PeakQuadraticCurve()),
                ),
              ),
            ),
            child: flightDirection == HeroFlightDirection.push
                ? RotationTransition(
                    turns: animation,
                    child: toHero.child,
                  )
                : FadeTransition(
                    opacity: animation.drive(
                      Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(
                          curve: Interval(0.0, 1.0, curve: ValleyQuadraticCurve()),
                        ),
                      ),
                    ),
                    child: toHero.child,
                  ),
          );
        },
        placeholderBuilder: (context, size, child) {
          return Opacity(opacity: 0.2, child: child);
        },
        createRectTween: (begin, end) {
          // Create and return your custom rect
          return MaterialRectArcTween(begin: begin, end: end);
        },
      ),
    );
  }
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -15 * math.pow(t, 2) + 15 * t + 1;
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * (math.pow(t - 0.5, 2)) as double;
  }
}
