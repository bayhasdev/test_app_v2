// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/template_section/payment_form.dart';

class TemplateSection extends StatefulWidget {
  static const String routeName = '/UIChalnage';
  @override
  _TemplateSectionState createState() => _TemplateSectionState();
}

class _TemplateSectionState extends State<TemplateSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Chalnage'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'Payment Template Page ', navigationWidget: PaymentTemplatePage()),
          ],
        ),
      ),
    );
  }
}
