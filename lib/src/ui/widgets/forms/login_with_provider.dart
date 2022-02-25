// ignore_for_file: prefer_final_fields, constant_identifier_names, unnecessary_overrides, unnecessary_type_check

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log('*********************** Login With Provider build');
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
          appBar: AppBar(title: Text('Login With Provider')),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  // Email Field
                  Consumer<LoginProvider>(builder: (context, provider, child) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: '“Email”',
                        errorText: provider.email.error,
                      ),
                      onChanged: (String value) {
                        provider.changeEmail(value);
                      },
                    );
                  }),

                  // Password Field
                  Consumer<LoginProvider>(builder: (context, provider, child) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: '“Password”',
                        errorText: provider.password.error,
                      ),
                      onChanged: (String value) {
                        provider.changePassword(value);
                      },
                    );
                  }),

                  //Update Indicator
                  Consumer<LoginProvider>(builder: (context, provider, child) {
                    return Container(
                      height: 150,
                      child: Center(
                        child: provider.state == ViewState.Idle ? Container() : CircularProgressIndicator(),
                      ),
                    );
                  }),

                  //Submit button will be enabled on correct format of email and password
                  Consumer<LoginProvider>(builder: (context, provider, child) {
                    return ElevatedButton(
                      child: Text('‘Submit’', style: TextStyle(color: Colors.white)),
                      onPressed: (!provider.isValid)
                          ? null
                          : () {
                              provider.submitLogin().then((LoginResponse response) {
                                print(' response: ${response.token} ');
                                Navigator.pop(context);
                              });
                            },
                    );
                  })
                ],
              ))),
    );
  }
}

class LoginProvider with ChangeNotifier implements LoaderState {
  LoginProvider() {
    setState(ViewState.Idle);
  }

  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  //Getters
  ValidationModel get email => _email;
  ValidationModel get password => _password;

  bool get isValid {
    if (_password.value != null && _email.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeEmail(String value) {
    if (ValidatorType.email.hasMatch(value)) {
      _email = ValidationModel(value, null);
    } else if (value.isEmpty) {
      _email = ValidationModel(null, null);
    } else {
      _email = ValidationModel(null, ' Enter a valid email ');
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (ValidatorType.password.hasMatch(value)) {
      _password = ValidationModel(value, null);
    } else if (value.isEmpty) {
      _password = ValidationModel(null, null);
    } else {
      _password = ValidationModel(null, ' Must have at least 8 characters ');
    }
    notifyListeners();
  }

  @override
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  ViewState get state => _state;

  Future<LoginResponse> submitLogin() async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(milliseconds: 1000));
    final response = LoginResponse('responseToken');
    setState(ViewState.Idle);
    if (response is LoginResponse) {
      print('response.token ${response.token}');
    }
    return response;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  ViewState _state = ViewState.Idle;
}

class ValidationModel {
  final String? value;
  final String? error;

  ValidationModel(this.value, this.error);
}

class LoginResponse {
  String token;
  LoginResponse(this.token);
}

class ValidatorType {
  static final RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\”]+(\.[^<>()[\]\\.,;:\s@\”]+)*)|(\”.+\”))@((\[[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\])|(([a-zA-Z\-0–9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp password = RegExp(r'^(?=.*)(.){8,15}$');
}

enum ViewState { Idle, Busy }

abstract class LoaderState {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  void setState(ViewState viewState);
}
