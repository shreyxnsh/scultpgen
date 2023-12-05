import 'package:flutter/material.dart';
import 'package:sculptgen/features/onboarding/onboarding.dart';
import 'package:sculptgen/utils/constants/text_strings.dart';
import 'package:sculptgen/utils/themes/theme.dart';
import 'package:get/get.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FTexts.appName,
      themeMode: ThemeMode.system,
      theme: FAppTheme.lightTheme,
      darkTheme: FAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
