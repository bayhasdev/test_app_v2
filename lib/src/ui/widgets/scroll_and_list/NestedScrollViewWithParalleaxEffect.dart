import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NestedScrollViewWithParalleaxEffect extends StatefulWidget {
  static const String routeName = '/NestedScrollViewWithParalleaxEffect';
  @override
  _NestedScrollViewWithParalleaxEffectState createState() => _NestedScrollViewWithParalleaxEffectState();
}

class _NestedScrollViewWithParalleaxEffectState extends State<NestedScrollViewWithParalleaxEffect> {
  late ScrollController scrollcontroller;

  @override
  void initState() {
    scrollcontroller = ScrollController()
      ..addListener(() {
        print(scrollcontroller.offset);
      });
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.amber));
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollcontroller,
        headerSliverBuilder: (context, value) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blue,
              expandedHeight: 0250,
              flexibleSpace: Image.asset('assets/images/dog_filter.jpg', fit: BoxFit.cover),
              pinned: true,
              title: Text('NestedScrollViewWithParalleaxEffect'),
            ),
          ];
        },
        body: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            _FirstItem(scrollcontroller),
            _Item('1'),
            _Item('2'),
            _Item('3'),
            _Item('4'),
            _Item('5'),
            _Item('6'),
            _Item('7'),
            _Item('8'),
          ],
        ),
      ),
    );
  }
}

class _FirstItem extends StatelessWidget {
  const _FirstItem(this.scrollcontroller);
  final ScrollController scrollcontroller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: scrollcontroller,
          builder: (_, __) {
            var height = 230 - scrollcontroller.offset;
            var maxHeight = 90.0;
            return Container(
              color: Color(0xFF26B89A),
              width: double.infinity,
              height: height < maxHeight
                  ? height > 0
                      ? height
                      : 0
                  : maxHeight,
            );
          },
        ),
        _Item('0'),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  const _Item(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
        child: Card(
          child: Container(
            width: 400,
            height: 100,
            child: Center(child: Text(title, style: Theme.of(context).textTheme.headline3)),
          ),
        ),
      ),
    );
  }
}
