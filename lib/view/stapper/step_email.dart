import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/preference.dart';
import 'package:fe_test/utils/utils.dart';

import 'package:fe_test/widget/button.dart';
import 'package:fe_test/widget/text_input.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

class StepEmail extends StatefulWidget {
  PageController? pageController;
  String? email;
  StepEmail({super.key, this.pageController, this.email});

  @override
  State<StepEmail> createState() => _StepEmailState();
}

class _StepEmailState extends State<StepEmail> {
  TextEditingController emailController = TextEditingController();
  double opacity = 0.5;
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
                "What's your Email?",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextView(
                  "You will recive an Email from Soul Train for\n confirmation",
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              TextInput(
                controller: emailController,
                fontSize: 15,
                keyBordType: TextInputType.emailAddress,
                fontWeight: FontWeight.bold,
                hintDescription: "Enter your Email Address",
                onChanged: (p0) {
                  setState(() {
                    widget.email = p0;
                    opacity = p0.isEmpty
                        ? 0.5
                        : isValidEmail(p0)
                            ? 1
                            : 0.5;
                  });
                },
              ),
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
    var email =
        await MyPreference.get(MyPreference.PREF_EMAIL, SharePrefType.String);
    setState(() {
      emailController.text = email;
    });
  }

  validation() async {
    print(widget.email);
    if (opacity == 1) {
      String email = emailController.text.toString();
      await MyPreference.add(MyPreference.PREF_EMAIL,
          emailController.text.toString(), SharePrefType.String);

      if (isValidEmail(email)) {
        setState(() {
          widget.pageController?.jumpToPage(4);
        });
      } else {
        showSnackBar("Please enter a valid email address", AlertType.ERROR);
      }
    }
  }
}
