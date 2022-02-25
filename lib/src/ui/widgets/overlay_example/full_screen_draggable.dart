import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenDraggablePage extends StatefulWidget {
  static const String routeName = '/FullScreenDraggablePage';
  @override
  _FullScreenDraggablePageState createState() => _FullScreenDraggablePageState();
}

class _FullScreenDraggablePageState extends State<FullScreenDraggablePage> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = 'assets/images/sample.png';
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      appBar: AppBar(
        title: Text('FullScreenDraggablePage'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: Hero(tag: imageUrl, child: Image.asset(imageUrl, height: 200)),
                onTap: () => Navigator.of(context)
                    .push(PageRouteBuilder(opaque: false, pageBuilder: (BuildContext context, _, __) => DissambleImageViewPage(url: imageUrl))),
                // onTap: () => Navigator.of(context).push(ImageViewOverlay(imageUrl)),
              ),
              Image.asset('assets/images/dog_filter.jpg'),
              Image.asset('assets/images/sample.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class DissambleImageViewPage extends StatefulWidget {
  static const String routeName = '/DissambleImageViewPage';
  final String url;

  const DissambleImageViewPage({required this.url});
  @override
  _DissambleImageViewPageState createState() => _DissambleImageViewPageState();
}

class _DissambleImageViewPageState extends State<DissambleImageViewPage> {
  late Widget imageWidget;
  late Size size;

  @override
  void initState() {
    imageWidget = PhotoView(
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
      heroAttributes: PhotoViewHeroAttributes(tag: widget.url),
      imageProvider: AssetImage(widget.url),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Center(
        child: Draggable(
          axis: Axis.vertical,
          onDragEnd: (details) {
            log(details.offset.dy.toString());
            if (details.offset.dy.abs() > 125) Navigator.pop(context);
          },
          child: Container(
            color: Colors.black87,
            child: imageWidget,
          ),
          feedback: SizedBox(
            height: size.height,
            width: size.width,
            child: imageWidget,
          ),
          childWhenDragging: SizedBox(),
        ),
      ),
    );
  }
}

class ImageViewOverlay extends ModalRoute<void> {
  final String url;

  late Widget imageWidget;
  ImageViewOverlay(this.url) {
    imageWidget = PhotoView(
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
      heroAttributes: PhotoViewHeroAttributes(tag: url),
      imageProvider: AssetImage(url),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  @override
  String get barrierLabel => 'barrierLabel';

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content

    return FadeTransition(
      opacity: animation,
      child: child,
      // child: ScaleTransition(
      //   scale: animation,
      //   child: child,
      // ),
    );
  }

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
      child: _buildOverlayContent(context),
    );
  }

  late Size size;
  Widget _buildOverlayContent(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Draggable(
              axis: Axis.vertical,
              onDragEnd: (details) {
                log(details.offset.dy.toString());
                if (details.offset.dy.abs() > 125) Navigator.pop(context);
              },
              child: Container(
                width: size.width,
                height: size.height,
                color: Colors.black87,
                child: imageWidget,
              ),
              feedback: Container(
                width: size.width,
                height: size.height,
                child: imageWidget,
              ),
              childWhenDragging: SizedBox(),
              data: url,
            ),
          ),
          // Positioned(
          //   top: -100,
          //   child: DragTarget(
          //     builder: (context, List<String> candidateData, rejectedData) {
          //       return Container(
          //         width: size.width,
          //         height: 300,
          //       );
          //     },
          //     onAcceptWithDetails: (details) {
          //       log('onAcceptWithDetails');
          //     },
          //     onLeave: (data) {
          //       log('onLeave');
          //     },
          //     onMove: (details) {
          //       log('onMove');
          //     },
          //     onWillAccept: (data) {
          //       log('onWillAccept');
          //       return true;
          //     },
          //     onAccept: (data) {
          //       log('onAccept');
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
