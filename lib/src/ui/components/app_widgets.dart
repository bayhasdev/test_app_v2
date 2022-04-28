// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/constants.dart';
import '../../../main_imports.dart';

class ListViewSingleItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? navigationWidget;
  final Function()? onTap;

  const ListViewSingleItem({required this.title, this.subTitle, this.navigationWidget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: ListTile(
        title: Text(title),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        onTap: () {
          if (onTap != null) onTap!();
          if (navigationWidget != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigationWidget!));
          }
        },
      ),
    );
  }
}

class ListViewSectionHeader extends StatelessWidget {
  final String title;

  const ListViewSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white)),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final int width;
  final int height;
  final Color? color;
  const BoxWidget({this.width = 50, this.height = 80, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      color: color ?? kColors.getRandomElement(),
      child: FittedBox(
        child: Text('$width x $height'),
      ),
    );
  }
}
