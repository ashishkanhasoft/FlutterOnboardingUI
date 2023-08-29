import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loginView();
  }

  Widget loginView() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  TextView(
                    'Enter the code we sent to',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  TextView('satyam@kanhasoft.com',
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    showCursor: true,
                    showFieldAsBox: true,
                    fieldWidth: 50,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                  //MyButton('Confirm', () => null)
                ],
              ),
            )
          ],
        ));
  }
}
