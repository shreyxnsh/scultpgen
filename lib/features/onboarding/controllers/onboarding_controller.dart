import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sculptgen/welcome.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;

  void upadtePageIndication(index) => currentPageIndex.value = index;

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      // FutureBuilder(future: context.read<UserProvider>().checkedLoggedInUser(), builder: (context, snapshot){},)
      Get.to(const WelcomeScreen());
    } else {
      // set page index
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
