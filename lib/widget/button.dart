// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:fe_test/theme/color.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String message;
  Color color;
  Color bgColor;
  Function()? onClick;
  bool nextIcon;
  bool isLoading;
  double opacity = 1;
  FontWeight fontweight;

  Button(
    this.message, {
    this.color = AppColor.color_white,
    this.bgColor = AppColor.color_red,
    this.isLoading = false,
    this.opacity = 1,
    this.fontweight = FontWeight.normal,
    this.nextIcon = false,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
            backgroundColor:
                const MaterialStatePropertyAll(AppColor.color_red)),
        onPressed: onClick,
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: nextIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                color: color,
                              ),
                            )
                          : Row(children: [
                              TextView(
                                fontWeight: fontweight,
                                fontSize: 14,
                                message,
                                color: color,
                              ),
                              const SizedBox(width: 3),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 10,
                                color: AppColor.color_white,
                              ),
                            ]),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                color: color,
                              ),
                            )
                          : TextView(
                              fontSize: 14,
                              message,
                              fontWeight: fontweight,
                              color: color,
                            ),
                    ],
                  )),
      ),
    );
  }
}
