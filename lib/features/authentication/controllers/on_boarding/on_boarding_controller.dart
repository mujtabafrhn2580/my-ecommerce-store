import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final GetStorage deviceStorage = GetStorage();

  void updatePageIndex(int index) {
    currentPage.value = index;
  }

  void dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void skipOnBoarding() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
    // Example navigation
  }

  void nextPage() async {
    if (currentPage.value == 2) {
      await deviceStorage.write('isFirstTime', false);
      Get.off(() => SignUpScreen());
    } else {
      currentPage.value = currentPage.value + 1;
      pageController.jumpToPage(currentPage.value);
    }
  }
  //Variables

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
