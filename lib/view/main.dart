import 'package:fe_test/theme/color.dart';
import 'package:fe_test/view/stapper/step_artist_name.dart';
import 'package:fe_test/view/stapper/step_email.dart';
import 'package:fe_test/view/stapper/step_name.dart';
import 'package:fe_test/view/stapper/step_otp_view.dart';
import 'package:fe_test/view/stapper/step_password.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  String? name;
  String? artistName;
  String? password;
  String? email;
  String? otpCode;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int? pageNumber = pageController.page?.round();
      if (pageNumber != currentIndex) {
        setState(() {
          currentIndex = pageNumber;
          pageController.jumpToPage(pageNumber!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.color_background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backIcon(),
            Center(
              child: Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: currentIndex! + 1,
                  selectedColor: AppColor.color_yellow,
                  unselectedColor: AppColor.color_steper_grey,
                  size: 8,
                  roundedEdges: const Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: (num) {
                  setState(() {
                    currentIndex = num;
                  });
                },
                children: [
                  StepName(
                    pageController: pageController,
                  ),
                  StepArtistName(
                    pageController: pageController,
                  ),
                  StepPassword(
                    pageController: pageController,
                  ),
                  StepEmail(
                    pageController: pageController,
                    email: email,
                  ),
                  StepOtpView(
                    pageController: pageController,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget backIcon() {
    return Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: currentIndex == 0
            ? Container()
            : GestureDetector(
                onTap: () {
                  handleBackPress();
                },
                child: Image.asset(
                  'lib/assets/images/back_button.png',
                  width: 20,
                  height: 20,
                ),
              ));
  }

  handleBackPress() {
    int? pageNumber = pageController.page?.round();
    if (pageNumber != 0) {
      pageController.jumpToPage(pageNumber! - 1);
    }
  }
}
