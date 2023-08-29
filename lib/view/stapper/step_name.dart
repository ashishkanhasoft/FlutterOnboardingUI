import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/preference.dart';
import 'package:fe_test/widget/button.dart';
import 'package:fe_test/widget/text_input.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

class StepName extends StatefulWidget {
  PageController? pageController;
  StepName({super.key, this.pageController});

  @override
  State<StepName> createState() => _StepNameState();
}

class _StepNameState extends State<StepName> {
  TextEditingController nameController = TextEditingController();
  double opacity = 0.5;
  @override
  void initState() {
    super.initState();
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
                "What's your Name?",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextView(
                  "Your birth name",
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextInput(
                controller: nameController,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                hintDescription: "Username",
                onChanged: (p0) {
                  setState(() {
                    opacity = p0.isEmpty ? 0.5 : 1;
                  });
                },
              ),
              const SizedBox(
                height: 10,
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
    var name =
        await MyPreference.get(MyPreference.PREF_NAME, SharePrefType.String);
    print(name);
    setState(() {
      nameController.text = name;
    });
  }

  validation() async {
    if (opacity == 1) {
      await MyPreference.add(MyPreference.PREF_NAME,
          nameController.text.toString(), SharePrefType.String);
      widget.pageController?.jumpToPage(1);
    }
  }
}
