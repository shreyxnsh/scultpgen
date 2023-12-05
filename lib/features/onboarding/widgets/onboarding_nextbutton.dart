import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sculptgen/features/onboarding/controllers/onboarding_controller.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/device/device_utility.dart';
import 'package:sculptgen/utils/helpers/helper_functions.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Positioned(
      right: FSizes.defaultSpace,
      bottom: FDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: OnBoardingController.instance.nextPage,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? FColors.primary : Colors.black,
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
        ),
      ),
    );
  }
}
