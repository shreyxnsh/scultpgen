import 'package:flutter/material.dart';
import 'package:sculptgen/features/onboarding/controllers/onboarding_controller.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/device/device_utility.dart';
import 'package:sculptgen/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = FHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: FDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: FSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? FColors.light : FColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
