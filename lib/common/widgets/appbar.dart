import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/device/device_utility.dart';
import 'package:sculptgen/utils/helpers/helper_functions.dart';

class FAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAppBar({
    super.key,
    this.title,
    this.showBackArrow = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.leadingIconColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? leadingIconColor;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color:
                      leadingIconColor ?? (dark ? FColors.light : FColors.dark),
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(
                      leadingIcon,
                      color: leadingIconColor ??
                          (dark ? FColors.light : FColors.dark),
                    ))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(FDeviceUtils.getAppBarHeight());
}
