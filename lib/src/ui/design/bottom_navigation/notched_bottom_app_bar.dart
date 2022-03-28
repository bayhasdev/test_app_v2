import 'package:flutter/material.dart';

////////////////{ Ref : https://www.youtube.com/watch?v=0gbFNFA1Lzs&ab_channel=JohannesMilke } ////////////////
class NotchedBottomAppBar extends StatefulWidget {
  static const String routeName = '/NotchedBottonAppBar';
  @override
  _NotchedBottomAppBarState createState() => _NotchedBottomAppBarState();
}

class _NotchedBottomAppBarState extends State<NotchedBottomAppBar> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text('Notched Bottom AppBar')),
      body: Container(color: Colors.red),
      floatingActionButton: FloatingActionButton(
        child: AnimatedIcon(icon: AnimatedIcons.add_event, progress: _animation),
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: _bottomNavigationBarItems(),
    );
  }

  Widget _bottomNavigationBarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
    );
  }
}
