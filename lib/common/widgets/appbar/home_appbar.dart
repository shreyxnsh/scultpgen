import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sculptgen/common/widgets/appbar/appbar.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';


class ThemeHomeAppBar extends StatelessWidget {
  const ThemeHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(FTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  ),
          Text(FTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  ),
        ],
      ),
      actions: [
        
        IconButton(onPressed: (){}, icon: Icon(Iconsax.profile_circle5), iconSize: 40, color: FColors.primary,)
        
      ],
    );
  }
}
