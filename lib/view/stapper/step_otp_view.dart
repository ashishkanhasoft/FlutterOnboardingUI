import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/preference.dart';
import 'package:fe_test/widget/button.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class StepOtpView extends StatefulWidget {
  PageController? pageController;

  StepOtpView({super.key, this.pageController});

  @override
  State<StepOtpView> createState() => _StepOtpViewState();
}

class _StepOtpViewState extends State<StepOtpView> {
  double opacity = 0.5;
  String email = "";
  bool otpErrorVisible = false;
  String buttonText = "NEXT";

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  getEmail() async {
    email =
        await MyPreference.get(MyPreference.PREF_EMAIL, SharePrefType.String);
    setState(() {
      email;
    });
  }

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
                "Enter the Code we sent to",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextView(
                  "$email",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.color_blue,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: OtpTextField(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  numberOfFields: 4,
                  borderColor: Colors.black,
                  focusedBorderColor: Colors.black,
                  borderWidth: 1.0,

                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  showCursor: true,
                  showFieldAsBox: true,
                  fieldWidth: 50,
                  filled: true,
                  enabledBorderColor: AppColor.color_steper_grey,
                  fillColor: AppColor.color_white,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    print(code);
                    validation(code, false);

                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    print(verificationCode);
                    validation(verificationCode, true);
                  }, // end onSubmit
                ),
              ),
              Visibility(
                visible: otpErrorVisible,
                child: TextView(
                  "*Invalid code. Please check your Email or Spam",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  color: AppColor.color_red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Button(
                  buttonText,
                  opacity: opacity,
                  fontweight: FontWeight.bold,
                  onClick: () => validation("", false),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      "Change Email Address",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: AppColor.color_blue,
                    ),
                    TextView(
                      "Send a new code",
                      fontSize: 12,
                      color: AppColor.color_blue,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: TextView(
                  "Verifying your account helps keep\n your account safe",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  manageWillPop() {}

  validation(String verificationCode, onsubmitclick) async {
    if (verificationCode.isNotEmpty) {
      if (verificationCode.length == 4) {
        setState(() {
          buttonText = "CONFIRM";
        });
        if (verificationCode == "1234") {
          await MyPreference.add(MyPreference.PREF_OTP,
              verificationCode.toString(), SharePrefType.String);
          setState(() {
            opacity = 1;
            otpErrorVisible = false;
          });

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Login sucessfully"),
                  content: Text('Code entered is $verificationCode'),
                );
              });
        } else {
          setState(() {
            opacity = 1;
            if (onsubmitclick) {
              otpErrorVisible = true;
            }
          });
        }
      } else {
        setState(() {
          opacity = 0.5;
          otpErrorVisible = false;
        });
      }
    } else {
      setState(() {
        otpErrorVisible = false;
      });
    }
  }
}
