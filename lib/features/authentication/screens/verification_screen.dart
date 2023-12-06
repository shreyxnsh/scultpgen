
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/features/authentication/screens/home.dart';
import 'package:sculptgen/features/authentication/screens/login.dart';
import 'package:sculptgen/features/authentication/screens/logo_with_title.dart';
import 'package:sculptgen/providers/user_provider.dart';
import 'package:sculptgen/shared/extension.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  //otp code
  late String _otpcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithTitle(
        title: 'Verification',
        subText: "Verification code has been sent to your mail",
        children: [
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (otpCode) {
                _otpcode = otpCode!;
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(hintText: "Enter OTP"),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final result = await context
                    .read<UserProvider>()
                    .confirmSignUp(username: widget.username, code: _otpcode);

                result.fold((error) => context.showError(error), (_) {
                  Get.to(HomeScreen());
                });
              }
            },
            child: context.watch<UserProvider>().isLoading ? CircularProgressIndicator(color: Colors.white,)
            : const Text("Validate"),
          ),
        ],
      ),
    );
  }
}
