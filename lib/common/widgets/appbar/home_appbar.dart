import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/common/widgets/appbar/appbar.dart';
import 'package:sculptgen/features/authentication/screens/login.dart';
import 'package:sculptgen/providers/user_provider.dart';
import 'package:sculptgen/shared/extension.dart';
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
        
        IconButton(onPressed: () async{

          final response = await context.read<UserProvider>().signOut();
          response.fold((error) => context.showError(error), (result) => Get.to(const LoginScreen()));

          // Get.to(ProfileScreen());
        }, 
        
        icon: context.watch<UserProvider>().isLoading ? const CircularProgressIndicator(color: Colors.black,): const Icon(Iconsax.logout), iconSize: 40, color: FColors.primary,)
        
      ],
    );
  }
}
