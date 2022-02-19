// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
