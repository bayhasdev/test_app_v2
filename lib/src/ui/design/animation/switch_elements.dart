import 'package:flutter/material.dart';

class SwitchElements extends StatefulWidget {
  @override
  _SwitchElementsState createState() => _SwitchElementsState();
}

class _SwitchElementsState extends State<SwitchElements> {
  bool _isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Elements')),
      body: SafeArea(
        child: ListView(
          children: [
            _towElementCrossFade(),
          ],
        ),
      ),
    );
  }

  Widget _towElementCrossFade() {
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () => setState(() => _isSearch = !_isSearch),
        ),
        title: AnimatedCrossFade(
          firstChild: Text('Title'),
          secondChild: TextField(),
          crossFadeState: _isSearch ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
