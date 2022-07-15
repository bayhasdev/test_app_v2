import 'package:flutter/material.dart';
import 'package:test_app_v2/generated/locale_base.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/design_page.dart';
import 'package:test_app_v2/src/ui/example_page.dart';
import 'package:test_app_v2/src/ui/template_section.dart';
import 'package:test_app_v2/src/ui/ui_chalnge.dart';
import 'package:test_app_v2/src/ui/widgets_page.dart';
import 'package:test_app_v2/src/utilities/global_var.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/MainPage';

  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    str = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test App'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListViewSingleItem(title: 'widgets', navigationWidget: WidgetsPage()),
            ListViewSingleItem(title: 'design Page', navigationWidget: DesignPage()),
            ListViewSingleItem(title: 'UI Chalnage', navigationWidget: UIChalnage()),
            ListViewSingleItem(title: 'Example Page', navigationWidget: ExamplePage()),
            ListViewSingleItem(title: 'Template Section page', navigationWidget: TemplateSection()),
          ],
        ),
      ),
    );
  }
}
