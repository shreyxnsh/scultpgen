import 'package:flutter/material.dart';
import 'package:sculptgen/common/widgets/appbar/home_appbar.dart';
import 'package:sculptgen/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
   
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
