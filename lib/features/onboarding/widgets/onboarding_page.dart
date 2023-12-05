import 'package:flutter/material.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/helpers/helper_functions.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: FHelperFunctions.screenWidth() * 1.8,
            height: FHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(
              image,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: FSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
