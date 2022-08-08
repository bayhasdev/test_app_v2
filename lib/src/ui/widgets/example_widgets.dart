import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/components/custom_icons.dart';
import '../../../main_imports.dart';

class ExampleWidgets extends StatelessWidget {
  static const String routeName = '/StatusBarColored';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            _statusBarColored(),
            Expanded(
              child: ListView(
                children: [
                  _dynamicWidgetHieght(),
                  _customIcons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _customIcons() {
    return Row(
      children: const [
        Text('CustomIcons : '),
        Icon(CustomIcons.catchReceipt, size: 25, color: Colors.red),
      ],
    );
  }

  Widget _statusBarColored() {
    return Row(children: [Container(height: 50, color: Colors.red), Container(height: 50, color: Colors.amber)].expadedEqually().toList());
  }

  Widget _dynamicWidgetHieght({int tallestHeight = 50}) {
    List<Widget> boxs = [BoxWidget(height: tallestHeight), BoxWidget(height: 30), BoxWidget(height: 40)];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: boxs),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: boxs,
          ),
        ),
      ],
    );
  }
}
