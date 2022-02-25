import 'package:flutter/material.dart';

class TextFieldValueListenable extends StatefulWidget {
  @override
  _TextFieldValueListenableState createState() => _TextFieldValueListenableState();
}

class _TextFieldValueListenableState extends State<TextFieldValueListenable> {
  final ValueNotifier<bool> _textHasErrorNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Text('Text Field ValueListenable'),
        ValueListenableBuilder<bool>(
          valueListenable: _textHasErrorNotifier,
          child: _getPrefixText(),
          builder: (context, hasError, child) {
            return Material(
              child: TextField(
                decoration: InputDecoration(
                  prefix: child,
                  fillColor: Colors.grey[100],
                  filled: true,
                  errorText: hasError ? 'Invalid value entered...' : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 0.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onChanged: (text) {
                  _textHasErrorNotifier.value = text.isEmpty || text.length < 5;
                },
              ),
            );
          },
        ),
        Divider(),
      ],
    );
  }

  Widget _getPrefixText() {
    return Icon(Icons.ac_unit);
  }
}
