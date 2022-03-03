import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_v2/src/ui/components/app_widgets.dart';
import 'package:test_app_v2/src/ui/widgets/forms/ChipsDemoApp.dart';
import 'package:test_app_v2/src/ui/widgets/forms/Payment-Card-Validation.dart';
import 'package:test_app_v2/src/ui/widgets/forms/login_with_provider.dart';
import 'package:test_app_v2/src/ui/widgets/forms/textFieldValueLisner.dart';

class FormIndexPage extends StatelessWidget {
  static const String routeName = '/FormIndexPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms and inputs'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _upperCaseOnly(),
            _buildCounterTExtField(),
            TextFieldValueListenable(),
            ListViewSingleItem(title: 'LoginScreenWithProvider', navigationWidget: LoginScreenWithProvider()),
            ListViewSingleItem(title: 'PaymentCardValidation', navigationWidget: PaymentCardValidation()),
            ListViewSingleItem(title: 'ChipsDemoScreen', navigationWidget: ChipsDemoScreen()),
          ],
        ),
      ),
    );
  }

  Widget _upperCaseOnly() {
    return TextFormField(
      decoration: InputDecoration(enabledBorder: OutlineInputBorder(), labelText: "UPPERCASE Only", helperText: "Hello"),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[A-Z]"))],
    );
  }

  Widget _buildCounterTExtField() {
    return TextFormField(
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => Text(' $currentLength from $maxLength'),
      maxLength: 10,
      decoration: InputDecoration(
        labelText: "userName",
        helperText: "Hello",
        prefix: Container(height: 22, width: 30, padding: EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.person_add)),
        icon: Icon(Icons.person),
      ),
    );
  }
}
