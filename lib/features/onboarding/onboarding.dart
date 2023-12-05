import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sculptgen/features/onboarding/controllers/onboarding_controller.dart';
import 'package:sculptgen/features/onboarding/widgets/onboarding_dotnavigation.dart';
import 'package:sculptgen/features/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:sculptgen/features/onboarding/widgets/onboarding_page.dart';
import 'package:sculptgen/features/onboarding/widgets/onboarding_skip.dart';
import 'package:sculptgen/utils/constants/image_strings.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.upadtePageIndication,
            children: const [
              OnBoardingPage(
                title: FTexts.onBoardingTitle1,
                subTitle: FTexts.onBoardingSubTitle1,
                image: FImages.onBoardingImage1,
              ),
              OnBoardingPage(
                title: FTexts.onBoardingTitle2,
                subTitle: FTexts.onBoardingSubTitle2,
                image: FImages.onBoardingImage2,
              ),
              OnBoardingPage(
                title: FTexts.onBoardingTitle3,
                subTitle: FTexts.onBoardingSubTitle3,
                image: FImages.onBoardingImage3,
              ),
            ],
          ),
          // skip button
          const OnBoardingSkipButton(),

          // dot navigation smooth page indication
          const OnBoardingDotNavigation(),
          // circular button

          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
