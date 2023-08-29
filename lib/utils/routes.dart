import 'dart:collection';

import 'package:fe_test/view/main.dart';
import 'package:fe_test/view/otp_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String strMainScreen = "mainScreen";
  static const String strOtpView = "otpView";

  static appRoutes() {
    Map<String, WidgetBuilder> routes = HashMap();
    routes[Routes.strMainScreen] = (context) => const MainScreen();
    routes[Routes.strOtpView] = (context) => const OtpView();

    return routes;
  }
}
