import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/relative_scroll/builder_method/relative_scroll_provider.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/relative_scroll/builder_method/relative_scroll_widgets.dart';

class RelativeScrollBuilderPage extends StatefulWidget {
  static const String routeName = '/RelativeScrollPage';
  @override
  _RelativeScrollBuilderPageState createState() => _RelativeScrollBuilderPageState();
}

class _RelativeScrollBuilderPageState extends State<RelativeScrollBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relative Scroll Page'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<RelativeScrollProvider>.value(
          value: RelativeScrollProvider(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _headerList()),
              Expanded(flex: 9, child: _bodyList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerList() {
    return Consumer<RelativeScrollProvider>(
      builder: (context, provider, child) => Card(
        elevation: 4,
        child: ListView.builder(
          itemCount: provider.shopList.length,
          controller: provider.headerScrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryHeaderSingleItem(index),
        ),
      ),
    );
  }

  Widget _bodyList() {
    return Consumer<RelativeScrollProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          controller: provider.scrollController,
          itemCount: provider.shopList.length,
          itemBuilder: (context, index) {
            log('$index');
            return ShopCard(
              model: provider.shopList[index],
              index: index,
              onHeight: (val) {
                provider.fillListPositionValues(val);
              },
            );
          },
        );
      },
    );
  }
}
