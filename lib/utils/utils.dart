import 'package:fe_test/main.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

bool isValidEmail(emailaddress) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(emailaddress);
}

bool isValidPassword(password) {
  return RegExp(r'.{8,}').hasMatch(password);
}

showSnackBar(message, type, {description = ""}) {
  if (navigatorState.currentContext != null) {
    FocusScope.of(navigatorState.currentContext!).requestFocus(FocusNode());

    ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(SnackBar(
      backgroundColor: (type == AlertType.ERROR)
          ? Colors.red
          : (type == AlertType.SUCCESS)
              ? Colors.green
              : (type == AlertType.WARNING)
                  ? Colors.yellow
                  : Colors.white,
      behavior: SnackBarBehavior.fixed,
      content: TextView(
        message,
        color: Colors.white,
        fontSize: 12,
        maxLines: 5,
      ),
    ));
    return ScaffoldMessenger.of(navigatorState.currentContext!)
        .showSnackBar(message);
  }
}

class AlertType {
  static const int ERROR = 0;
  static const int SUCCESS = 1;
  static const int WARNING = 2;
  static const int INFO = 4;
  static const int CUSTOM = 5;
}
