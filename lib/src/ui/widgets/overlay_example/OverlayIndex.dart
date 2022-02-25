import 'package:flutter/material.dart';

import 'full_screen_draggable.dart';

class OverlayIndex extends StatefulWidget {
  static const String routeName = '/OverlayOverSecreens';
  @override
  _OverlayIndexState createState() => _OverlayIndexState();
}

class _OverlayIndexState extends State<OverlayIndex> {
  @override
  void initState() {
    Future.microtask(() => _insertOverlay(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (overLayEntry != null) overLayEntry!.remove();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(title: Text('Overlay Over Secreens')),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                child: Text('go to Page2'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return OverlayOverSecreensPage2();
                  }));
                },
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(TutorialOverlay()),
                child: Text('Show Tutorial Overlay'),
              ),
              ElevatedButton(
                child: Text('Show Tutorial Overlay 2'),
                onPressed: () => Navigator.of(context)
                    .push(PageRouteBuilder(opaque: false, pageBuilder: (BuildContext context, _, __) => RedeemConfirmationScreen())),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullScreenDraggablePage())),
                child: Text('Full Screen DraggablePage'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry? overLayEntry;
  void _insertOverlay(BuildContext context) {
    overLayEntry = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      print(size.width);
      return Positioned(
        width: 56,
        height: 56,
        top: size.height - 72,
        left: size.width - 72,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => print('ON TAP OVERLAY!'),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
              child: Text('fsdfdsf'),
            ),
          ),
        ),
      );
    });
    return Overlay.of(context)?.insert(overLayEntry!);
  }
}

class OverlayOverSecreensPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text('back to Page1')),
      body: Container(
        alignment: Alignment.center,
        child: Text('Page 2'),
      ),
    );
  }
}

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => 'barrierLabel';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'This is a nice overlay',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Dismiss'),
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: RotationTransition(
          turns: animation,
          child: child,
        ),
      ),
    );
  }
}

class RedeemConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85), // this is the main reason of transparency at next screen.
      body: Center(
        child: TextButton(
          child: Text('dissmiss'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
