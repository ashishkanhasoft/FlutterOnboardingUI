// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColor {
  static const Color color_black = Color(0xFF3d3d3d);
  static const Color color_white = Color(0xFFFFFFFF);

  static const Color color_red = Color(0xFFd62c16);
  static const Color color_background = Color(0xFFf1f1f1);
  static const Color color_steper_grey = Color(0xFFd9d9d9);
  static const Color color_yellow = Color(0xFFFAC21E);
  static const Color color_blue = Color(0xff4293EE);

  static const Color color_selected = Color(0xFF2FA1DB);
  static const Color color_unselected = Color(0xff757575);

  static const MaterialColor colorPrimary = MaterialColor(
    0xFF2FA1DB,
    {
      50: Color.fromRGBO(47, 161, 219, .1),
      100: Color.fromRGBO(47, 161, 219, .2),
      200: Color.fromRGBO(47, 161, 219, .3),
      300: Color.fromRGBO(47, 161, 219, .4),
      400: Color.fromRGBO(47, 161, 219, .5),
      500: Color.fromRGBO(47, 161, 219, .6),
      600: Color.fromRGBO(47, 161, 219, .7),
      700: Color.fromRGBO(47, 161, 219, .8),
      800: Color.fromRGBO(47, 161, 219, .9),
      900: Color.fromRGBO(47, 161, 219, 1),
    },
  );
}
