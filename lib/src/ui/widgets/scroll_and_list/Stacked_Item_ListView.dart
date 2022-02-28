import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/colors.dart';

////////////////{ ref : https://www.youtube.com/watch?v=Cn6VCTaHB-k } ////////////////
class StackedItemListView extends StatefulWidget {
  static const String routeName = '/StackedItemListView';
  @override
  _StackedItemListViewState createState() => _StackedItemListViewState();
}

class _StackedItemListViewState extends State<StackedItemListView> {
  ScrollController _scrollController = ScrollController();
  double categoryCardHeight = 120;
  double listTopElement = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      listTopElement = _scrollController.offset / 119;
      log('_scrollController.offset = ${_scrollController.offset}');
      log('listTopElement = $listTopElement');
      setState(() {
        categoryCardHeight = _scrollController.offset > 50 ? 0 : 120;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = -1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stacked Item ListView'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Afad Resturant', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                Text('Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
              ],
            ),
            SizedBox(height: 20),
            buildCategorySection(index, context),
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: foodDataList.length,
                  itemBuilder: (ctx, index) {
                    double scale = 1.0;
                    if (listTopElement > 0.5) {
                      scale = index + 0.5 - listTopElement;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    log('scale = $scale');
                    return Opacity(
                      opacity: scale,
                      child: Transform.scale(
                        scale: scale,
                        alignment: Alignment.bottomCenter,
                        child: buildFoodCard(context, index),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildFoodCard(BuildContext context, int index) {
    return Align(
      heightFactor: 0.7,
      alignment: Alignment.topCenter,
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.yellow.shade200)],
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodDataList[index]['name'].toString(), style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 10),
                    Text(foodDataList[index]['brand'].toString(), style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: 10),
                    Text(foodDataList[index]['price'].toString(), style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              Image.asset('assets/images/logo.png', height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(int index, BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: categoryCardHeight == 120 ? 1 : 0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: categoryCardHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FittedBox(
            alignment: Alignment.topCenter,
            child: Row(
              children: foodDataList.map((e) {
                index++;
                return Card(
                  color: colorsList[index],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(foodDataList[index]['name'], style: Theme.of(context).textTheme.headline5),
                        SizedBox(height: 15),
                        Text(foodDataList[index]['price'].toString(), style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> foodDataList = [
  {"name": "Burger", "brand": "Hawkers", "price": 2.99, "image": "burger.png"},
  {"name": "Cheese Dip", "brand": "Hawkers", "price": 4.99, "image": "cheese_dip.png"},
  {"name": "Cola", "brand": "Mcdonald", "price": 1.49, "image": "cola.png"},
  {"name": "Fries", "brand": "Mcdonald", "price": 2.99, "image": "fries.png"},
  {"name": "Ice Cream", "brand": "Ben & Jerry's", "price": 9.49, "image": "ice_cream.png"},
  {"name": "Noodles", "brand": "Hawkers", "price": 4.49, "image": "noodles.png"},
  {"name": "Pizza", "brand": "Dominos", "price": 17.99, "image": "pizza.png"},
  {"name": "Sandwich", "brand": "Hawkers", "price": 2.99, "image": "sandwich.png"},
  {"name": "Wrap", "brand": "Subway", "price": 6.99, "image": "wrap.png"},
  {"name": "Burger", "brand": "Hawkers", "price": 2.99, "image": "burger.png"},
  {"name": "Cheese Dip", "brand": "Hawkers", "price": 4.99, "image": "cheese_dip.png"},
  {"name": "Cola", "brand": "Mcdonald", "price": 1.49, "image": "cola.png"},
  {"name": "Fries", "brand": "Mcdonald", "price": 2.99, "image": "fries.png"},
  {"name": "Ice Cream", "brand": "Ben & Jerry's", "price": 9.49, "image": "ice_cream.png"},
  {"name": "Noodles", "brand": "Hawkers", "price": 4.49, "image": "noodles.png"},
  {"name": "Pizza", "brand": "Dominos", "price": 17.99, "image": "pizza.png"},
  {"name": "Sandwich", "brand": "Hawkers", "price": 2.99, "image": "sandwich.png"},
  {"name": "Wrap", "brand": "Subway", "price": 6.99, "image": "wrap.png"}
];
