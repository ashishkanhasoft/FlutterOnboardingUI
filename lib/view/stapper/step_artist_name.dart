import 'package:fe_test/theme/color.dart';
import 'package:fe_test/utils/preference.dart';
import 'package:fe_test/widget/button.dart';
import 'package:fe_test/widget/text_input.dart';
import 'package:fe_test/widget/text_input_image.dart';
import 'package:fe_test/widget/textview.dart';
import 'package:flutter/material.dart';

class StepArtistName extends StatefulWidget {
  PageController? pageController;

  StepArtistName({super.key, this.pageController});

  @override
  State<StepArtistName> createState() => _StepArtistNameState();
}

class _StepArtistNameState extends State<StepArtistName> {
  double opacity = 0.5;
  TextEditingController artistNameController = TextEditingController();
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
                "What's your Artist Name?",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextView(
                  "How would your crew call you?",
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              TextInputImage(
                iconColor: Colors.green,
                controller: artistNameController,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                hintDescription: "Username Ex:Test",
                onChanged: (p0) {
                  setState(() {
                    opacity = p0.isEmpty ? 0.5 : 1;
                  });
                },
                imageCallback: () {},
                imagepath: opacity == 1 ? 'lib/assets/images/check.png' : "",
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
    var artist = await MyPreference.get(
        MyPreference.PREF_ARTIST_NAME, SharePrefType.String);
    artistNameController.text = artist;
    setState(() {});
  }

  void validation() async {
    if (opacity == 1) {
      await MyPreference.add(MyPreference.PREF_ARTIST_NAME,
          artistNameController.text.toString(), SharePrefType.String);

      widget.pageController?.jumpToPage(2);
    }
  }
}
