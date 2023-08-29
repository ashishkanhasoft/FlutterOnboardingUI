import 'package:fe_test/theme/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextView extends StatelessWidget {
  String message;
  double fontSize;
  Color color;
  int? maxLines;
  TextAlign textAlign;
  bool isUnderline;
  FontWeight fontWeight;

  TextView(
    this.message, {
    super.key,
    this.fontSize = 16,
    this.color = Colors.black87,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: textAlign,
      maxLines: maxLines,
      style: Style.txtStyle.copyWith(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none),
    );
  }
}
