import 'package:flutter/material.dart';
import 'package:sculptgen/common/widgets/appbar/appbar.dart';
import 'package:sculptgen/utils/constants/sizes.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: FAppBar(title: Text("Tools"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
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
