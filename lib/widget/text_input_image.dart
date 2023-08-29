// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:fe_test/theme/color.dart';
import 'package:fe_test/theme/style.dart';
import 'package:flutter/material.dart';

class TextInputImage extends StatefulWidget {
  TextEditingController? controller;
  String? hintTextTitle;
  String? hintDescription;

  String? labelText;
  Color color;
  Color iconColor;
  int? maxLines;
  int? maxLength;

  TextAlign textAlign;
  FontWeight fontWeight;
  double fontSize = 16;
  IconData? prefixIconData;
  bool enable = false;
  Function()? onTap;
  Function()? selectedValue;

  TextInputType? keyBordType = TextInputType.text;
  FocusNode? focusNode;
  bool isObscureText;
  void Function(String)? onChanged;
  String imagepath;
  Function() imageCallback;

  TextInputImage(
      {this.hintTextTitle,
      this.hintDescription,
      this.iconColor = AppColor.color_black,
      required this.controller,
      this.labelText,
      this.color = AppColor.color_black,
      this.maxLines,
      this.maxLength,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.w400,
      required this.fontSize,
      this.prefixIconData,
      this.enable = false,
      this.keyBordType,
      this.onTap,
      this.focusNode,
      this.isObscureText = false,
      this.onChanged,
      required this.imagepath,
      required this.imageCallback});
  @override
  TextInputImageState createState() => TextInputImageState();
}

class TextInputImageState extends State<TextInputImage> {
  @override
  void dispose() {
    super.dispose();
    // widget.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.imagepath.isNotEmpty
              ? Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColor.color_white,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      hintText: widget.hintDescription,
                      hintStyle: TextStyle(
                          fontSize: widget.fontSize,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300),
                      labelText: widget.labelText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: widget.imageCallback,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            width: 5,
                            height: 5,
                            widget.imagepath,
                            color: widget.iconColor,
                          ),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(width: 1, color: AppColor.color_black),
                      ),
                    ),
                    readOnly: widget.enable,
                    enableInteractiveSelection: widget.enable,
                    onChanged: widget.onChanged,
                    focusNode: widget.focusNode,
                    onTap: () => widget.onTap,
                    keyboardType: widget.keyBordType ?? widget.keyBordType,
                    controller: widget.controller,
                    cursorColor: AppColor.color_black,
                    textAlign: widget.textAlign,
                    maxLength: widget.maxLength,
                    showCursor: !widget.enable,
                    obscureText: widget.isObscureText,
                    style: Style.txtStyle.copyWith(
                        color: widget.color,
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight),
                  ),
                )
              : Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: AppColor.color_white,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      hintText: widget.hintDescription,
                      hintStyle: TextStyle(
                          fontSize: widget.fontSize,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300),
                      labelText: widget.labelText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(width: 1, color: AppColor.color_black),
                      ),
                    ),
                    readOnly: widget.enable,
                    enableInteractiveSelection: widget.enable,
                    onChanged: widget.onChanged,
                    focusNode: widget.focusNode,
                    onTap: () => widget.onTap,
                    keyboardType: widget.keyBordType ?? widget.keyBordType,
                    controller: widget.controller,
                    cursorColor: AppColor.color_black,
                    textAlign: widget.textAlign,
                    maxLength: widget.maxLength,
                    showCursor: !widget.enable,
                    obscureText: widget.isObscureText,
                    style: Style.txtStyle.copyWith(
                        color: widget.color,
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight),
                  ),
                ),
        ],
      ),
    );
  }
}
