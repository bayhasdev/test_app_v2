import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollablePositionedListWidget extends StatefulWidget {
  ////////////////{ ref : https://pub.dev/packages/scrollable_positioned_list } ////////////////
  static const String routeName = '/ScrollablePositionedList';
  @override
  _ScrollablePositionedListWidgetState createState() => _ScrollablePositionedListWidgetState();
}

class _ScrollablePositionedListWidgetState extends State<ScrollablePositionedListWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  late TextEditingController _editingController;
  String currentPosition = "";

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      setState(() => currentPosition = itemPositionsListener.itemPositions.value.first.index.toString());
    });
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scrollable positioned list'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _editingController,
                  autofocus: true,
                )),
                ElevatedButton(
                    child: Text('scroll'),
                    onPressed: () => itemScrollController.scrollTo(
                        index: int.parse(_editingController.text), duration: Duration(seconds: 2), curve: Curves.easeInOutCubic)),
                ElevatedButton(
                  child: Text('jumpTo'),
                  onPressed: () => itemScrollController.jumpTo(index: int.parse(_editingController.text)),
                )
              ],
            ),
            Card(child: Padding(padding: EdgeInsets.all(16), child: Text(currentPosition))),
            Expanded(
              child: ScrollablePositionedList.builder(
                itemCount: 500,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: index % 2 == 0 ? 50.0 : 75,
                    child: Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text('Item $index', style: TextStyle(fontSize: 18)),
                        )),
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
