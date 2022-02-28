import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/countries.dart';

class ListViewFilterPage extends StatefulWidget {
  static const String routeName = '/ListViewFilterPage';
  @override
  _ListViewFilterPageState createState() => _ListViewFilterPageState();
}

class _ListViewFilterPageState extends State<ListViewFilterPage> {
  TextEditingController controller = TextEditingController();
  String? filter;

  @override
  void initState() {
    super.initState();
    //fill countries with objects
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Filter Page'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        controller.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                    hintText: "Search...",
                  ),
                  controller: controller,
                )),
            Expanded(
              child: Padding(padding: EdgeInsets.only(top: 8.0), child: _buildListView()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          if (filter == null || filter == "") {
            return _buildRow(countries[index]);
          } else {
            if (countries[index].name.toLowerCase().contains(filter!.toLowerCase())) {
              return _buildRow(countries[index]);
            } else {
              return Container();
            }
          }
        });
  }

  Widget _buildRow(Country c) {
    return ListTile(
        onTap: () {
          log('tap on :${c.name}');
        },
        title: Text(
          c.name,
        ),
        subtitle: Text(
          c.code.toString(),
        ));
  }
}
