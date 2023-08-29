import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/preference.dart';
import 'package:fe_test/utils/utils.dart';
import 'package:fe_test/widget/button.dart';
import 'package:fe_test/widget/text_input.dart';
import 'package:fe_test/widget/text_input_image.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

class StepPassword extends StatefulWidget {
  PageController? pageController;
  String? password;
  StepPassword({super.key, this.pageController, this.password});

  @override
  State<StepPassword> createState() => _StepPasswordState();
}

class _StepPasswordState extends State<StepPassword> {
  TextEditingController passwordController = TextEditingController();
  double opacity = 0.5;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => manageWillPop(),
      child: Scaffold(
        backgroundColor: AppColor.color_background,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextView(
                "Choose a password",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextView(
                  "Your password must be 8 charecters or more",
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              TextInputImage(
                  isObscureText: !isShowPassword,
                  controller: passwordController,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  hintDescription: "Password",
                  onChanged: (p0) {
                    widget.password = p0;
                    setState(() {
                      opacity = isValidPassword(p0) ? 1 : 0.5;
                    });
                  },
                  imageCallback: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  imagepath: isShowPassword
                      ? 'lib/assets/images/password_visible.png'
                      : 'lib/assets/images/password_invisible.png'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Button(
                  "NEXT",
                  opacity: opacity,
                  fontweight: FontWeight.bold,
                  onClick: () => validation(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  manageWillPop() async {
    var password = await MyPreference.get(
        MyPreference.PREF_PASSWORD, SharePrefType.String);
    setState(() {
      passwordController.text = password;
    });
  }

  validation() async {
    if (opacity == 1) {
      await MyPreference.add(MyPreference.PREF_PASSWORD,
          passwordController.text.toString(), SharePrefType.String);
      widget.pageController?.jumpToPage(3);
    }
  }
}
