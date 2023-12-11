import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/features/authentication/screens/login.dart';
import 'package:sculptgen/features/authentication/screens/verification_screen.dart';
import 'package:sculptgen/providers/user_provider.dart';
import 'package:sculptgen/shared/extension.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/image_strings.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password;


  void signUp(String username, String password, String email) async {
    final signUpResult =
        await context.read<UserProvider>().signUp(username, password, email);
    signUpResult.fold(
      (error) => context.showError(error),
      (step) {
        if (step.nextStep.signUpStep == AuthSignUpStep.confirmSignUp) {
          Get.to(VerificationScreen(username: username));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    FTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: FSizes.sm,
                  ),
                  Text(
                    FTexts.signupSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: FSizes.spaceBtwSections,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: FTexts.requiredField),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: FTexts.username),
                        onSaved: (username) {
                          _username = username!;
                        },
                      ),
                      const SizedBox(
                        height: FSizes.spaceBtwItems,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.personalcard),
                            labelText: FTexts.email),
                        onSaved: (email) {
                          _email = email!;
                        },
                        validator:
                            RequiredValidator(errorText: FTexts.requiredField),
                      ),
                      const SizedBox(
                        height: FSizes.spaceBtwItems,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            suffixIcon: Icon(Iconsax.eye_slash),
                            labelText: "Password"),
                        onSaved: (passaword) {
                          _password = passaword!;
                        },
                        validator:
                            RequiredValidator(errorText: FTexts.requiredField),
                      ),
                      const SizedBox(
                        height: FSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(
                            width: FSizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${FTexts.iAgreeTo} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  TextSpan(
                                      text: FTexts.privacyPolicy,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(
                                            color: FColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: FColors.primary,
                                          )),
                                  TextSpan(
                                      text: ' ${FTexts.and} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  TextSpan(
                                      text: FTexts.termsOfUse,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(
                                            color: FColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: FColors.primary,
                                          )),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis, // Add this line
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: FSizes.spaceBtwSections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              signUp(_username, _password, _email);
                            }
                          },
                          child: context.watch<UserProvider>().isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text(FTexts.createAccount),
                        ),
                      ),
                      const SizedBox(
                        height: FSizes.spaceBtwItems,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child: const Text(FTexts.alreadylogin),
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
              const SizedBox(
                height: FSizes.spaceBtwItems,
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
                height: FSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: FColors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            width: FSizes.xl,
                            height: FSizes.xl,
                            image: AssetImage(FImages.google)),
                      )),
                  const SizedBox(
                    width: FSizes.spaceBtwItems,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: FColors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            width: FSizes.xl,
                            height: FSizes.xl,
                            image: AssetImage(FImages.facebook)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
