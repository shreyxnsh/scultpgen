import 'package:flutter/material.dart';
import 'package:sculptgen/features/onboarding/controllers/onboarding_controller.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/device/device_utility.dart';


class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: FDeviceUtils.getAppBarHeight(),
      right: FSizes.defaultSpace,
      child: TextButton(
        onPressed: OnBoardingController.instance.skipPage,
        child: const Text(
          'Skip',
        ),
      ),
    );
  }
}
