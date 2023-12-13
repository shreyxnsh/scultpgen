import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sculptgen/features/authentication/screens/login.dart';
import 'package:sculptgen/features/authentication/screens/signup.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: 
        const EdgeInsets.all(FSizes.defaultSpace), 
        child: 
        Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            Center(
                child: Column(
                  children : [
                    const Text("Welcome"),
                    const SizedBox(
                      height: FSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: const Text(FTexts.signIn),
                      ),
                    ),
                    const SizedBox(
                      height: FSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(const SignupScreen());
                        },
                        child: const Text(FTexts.createAccount),
                      ),
                    ),
            
                  ]
                  
                ),
              ),
            
          ],
        ),),
      ),
    );
  }
}