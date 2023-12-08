import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/features/authentication/screens/home.dart';
import 'package:sculptgen/features/authentication/screens/signup.dart';
import 'package:sculptgen/providers/user_provider.dart';
import 'package:sculptgen/shared/extension.dart';
import 'package:sculptgen/utils/constants/colors.dart';
import 'package:sculptgen/utils/constants/image_strings.dart';
import 'package:sculptgen/utils/constants/sizes.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  late String _username, _password;

  void signIn({required String username, required String password}) async {
    final signInResponse = await context
        .read<UserProvider>()
        .signIn(username: username, password: password);

    signInResponse.fold((error) => context.showError(error), (signInResult) {
      if (signInResult.nextStep.signInStep == AuthSignInStep.done) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      }
    });
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
                   key: _formKey,
                  child: Column(
                children: [
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: FTexts.requiredField),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: FTexts.username),
                    textInputAction: TextInputAction.next,
                    onSaved: (username) {
                      // Save it
                      _username = username!;
                    },
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "Password is required"),
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                        labelText: "Password"),
                    onSaved: (password) {
                      // Save it
                      _password = password!;
                    },
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          signIn(username: _username, password: _password);
                        }
                      },
                      child: context.watch<UserProvider>().isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(FTexts.signIn),
                    ),
                  ),
                  const SizedBox(
                    height: FSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(SignupScreen());
                      },
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
