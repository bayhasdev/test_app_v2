import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_v2/src/utilities/app_theme.dart';
import 'package:test_app_v2/src/utilities/constants.dart';
import 'package:test_app_v2/src/utilities/global_var.dart';
import '../../../main_imports.dart';

class PaymentTemplatePage extends StatelessWidget {
  static const String routeName = '/';
  PaymentTemplatePage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Template Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PaymentFormSection(formKey: formKey),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) log('payment form is valid');
                },
                child: Text('submit')),
          ],
        ),
      ),
    );
  }
}

class PaymentFormSection extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const PaymentFormSection({this.formKey});
  @override
  _PaymentFormSectionState createState() => _PaymentFormSectionState();
}

class _PaymentFormSectionState extends State<PaymentFormSection> {
  late CartProvider provider;

  @override
  void initState() {
    super.initState();
    provider = CartProvider();
    if (!kDebugMode) {
      // CartProvider provider = Provider.of<CartProvider>(context, listen: false);
      provider.paymentModel.year = '24';
      provider.paymentModel.month = '3';
      provider.paymentModel.nameOnCard = 'Mohammad Husam Khankan';
      provider.paymentModel.number = '5188963003910611';
      provider.paymentModel.cvc = '011';
    }
  }

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<CartProvider>(context);
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: AppTheme.standardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardNumber(),
            const SizedBox(height: 10),
            _name(),
            const SizedBox(height: 10),
            _expireDate(),
            const SizedBox(height: 10),
            Row(
              children: [
                _ccv(),
                Image.asset(kAssetsImageBase + 'visalogo.png', height: 25),
              ].expadedEqually().toList(),
            ),
          ],
        ),
      ),
    );
  }

  Row _expireDate() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: provider.paymentModel.year,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(4),
            ],
            keyboardType: TextInputType.number,
            decoration: AppTheme.getFilledTextFieldDecoration(hint: 'str.app.year'),
            validator: (value) => GlobalVar.checkString(value) || (int.tryParse(value!) == null) ? 'str.msg.fillFieldInt' : null,
            onChanged: (String value) => provider.paymentModel.year = value,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            initialValue: provider.paymentModel.month,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(2),
              CardMonthInputFormatter(),
            ],
            keyboardType: TextInputType.number,
            decoration: AppTheme.getFilledTextFieldDecoration(hint: 'str.app.month'),
            validator: (value) => GlobalVar.checkString(value) || (int.tryParse(value!) == null) ? 'str.msg.fillFieldInt' : null,
            onChanged: (String value) => provider.paymentModel.month = value,
          ),
        ),
      ],
    );
  }

  Widget _cardNumber() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        initialValue: provider.paymentModel.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(19),
          CardNumberInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        decoration: AppTheme.getFilledTextFieldDecoration(hint: 'str.app.creditCardNumber'),
        validator: (value) => GlobalVar.checkString(value) || (int.tryParse(getCleanedNumber(value!)) == null) ? 'str.msg.fillFieldInt' : null,
        onChanged: (String value) => provider.paymentModel.number = getCleanedNumber(value),
      ),
    );
  }

  Widget _ccv() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        initialValue: provider.paymentModel.cvc,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
        ],
        keyboardType: TextInputType.number,
        decoration: AppTheme.getFilledTextFieldDecoration(hint: 'str.app.ccv'),
        validator: (value) => GlobalVar.checkString(value) || (int.tryParse(value!) == null) ? 'str.msg.fillFieldInt' : null,
        onChanged: (String value) => provider.paymentModel.cvc = getCleanedNumber(value),
      ),
    );
  }

  Row _name() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: provider.paymentModel.nameOnCard,
            decoration: AppTheme.getFilledTextFieldDecoration(hint: 'str.app.nameOnCard'),
            inputFormatters: [
              LengthLimitingTextInputFormatter(45),
            ],
            validator: (value) => !GlobalVar.checkString(value) ? 'str.msg.invalidName' : null,
            onChanged: (String value) => provider.paymentModel.nameOnCard = value,
          ),
        ),
      ],
    );
  }

  String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    log('getCleanerNumber : ${text.replaceAll(regExp, '')}');
    var dd = text.replaceAll(regExp, '');
    return dd;
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    int month = int.tryParse(newText) ?? 1;
    if (month > 1 && month > 12) newText = oldValue.text;
    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }
}

class PaymentModel {
  String? nameOnCard, month, year, cvc, number;
}

class CartProvider {
  PaymentModel paymentModel = PaymentModel();
}
