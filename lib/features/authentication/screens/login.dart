import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/image_strings.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: FSizes.xl,
                  ),
                  Image.asset(
                    "assets/icons/sclogo.png",
                    width: 120,
                    height: 120,
                  ),
                  
                  const SizedBox(
                    height: FSizes.spaceBtwItems,
                  ),
                  Text(
                    FTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: FSizes.sm,
                  ),
                  Text(
                    FTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: FSizes.spaceBtwSections,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: FTexts.username),
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                        labelText: "Password"),
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text(FTexts.rememberMe)
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(FTexts.forgetPassword))
                    ],
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(FTexts.signIn),
                    ),
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(FTexts.createAccount),
                    ),
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwSections,
                  ),
                ],
              )),
              const SizedBox(
                height: FSizes.spaceBtwItems / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    FTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(child: Divider()),
                ],
              ),
              const SizedBox(
                height: FSizes.spaceBtwItems / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: FColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: FSizes.xl,
                        height: FSizes.xl,
                        image : AssetImage(FImages.google)
                      ),
                    )
                  ),

                  const SizedBox(width: FSizes.spaceBtwItems,),
                  
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: FColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: FSizes.xl,
                        height: FSizes.xl,
                        image : AssetImage(FImages.facebook)
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
