import 'package:flutter/material.dart';
import 'dart:math';

class ScrollToElement extends StatefulWidget {
  static const route = '/scroll_to_element';

  @override
  _ScrollToElementState createState() => _ScrollToElementState();
}

class _ScrollToElementState extends State<ScrollToElement> {
  late List<ListItem> list;
  @override
  void initState() {
    super.initState();
    List<int> intList = [];
    for (int i = 0; i < 100; ++i) {
      intList.add(i);
    }
    list = intList.map((element) => ListItem(index: element)).toList();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ListItem item = list.elementAt(70);
      Scrollable.ensureVisible(item.itemKey.currentContext!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('DoYouEvenFlutter'),
            Text('EP.1 - Scroll to Element in list'),
          ],
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: list
                .map((element) => Container(
                      key: element.itemKey,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      height: Random().nextInt(80) + 20.0,
                      child: Center(
                        child: Text(element.index.toString()),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = Random();
          int randomNumber = random.nextInt(100);
          debugPrint(randomNumber.toString());
          ListItem item = list.elementAt(randomNumber);
          Scrollable.ensureVisible(
            item.itemKey.currentContext!,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
            alignment: 0.5,
          );
        },
        tooltip: 'Increment',
        child: Text('Roll'),
      ),
    );
  }
}

class ListItem {
  final GlobalKey itemKey = GlobalKey();
  final int index;
  ListItem({required this.index});
}
