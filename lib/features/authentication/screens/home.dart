import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/common/widgets/appbar/appbar.dart';
import 'package:sculptgen/common/widgets/appbar/home_appbar.dart';
import 'package:sculptgen/features/authentication/screens/login.dart';
import 'package:sculptgen/providers/user_provider.dart';
import 'package:sculptgen/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body: SingleChildScrollView(
        child: Column(
          children: [
            ThemeHomeAppBar(),
            Padding(
              padding: EdgeInsets.all(FSizes.defaultSpace),
              child: Column(
                children: [
                  

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
