import 'package:flutter/material.dart';
import 'package:sculptgen/common/widgets/appbar.dart';
import 'package:sculptgen/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
