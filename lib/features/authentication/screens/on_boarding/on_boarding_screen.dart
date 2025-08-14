import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/on_boarding/on_boarding_controller.dart';
import 'package:my_store/features/authentication/screens/on_boarding/on_boarding_page.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:developer' as devtools;

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            children: [
              OnBoardingPage(
                image: TImages.tOnBoardingImage1,

                title: TTexts.tOnBoardingTitle1,
                subtitle: TTexts.tOnBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.tOnBoardingImage2,

                title: TTexts.tOnBoardingTitle2,
                subtitle: TTexts.tOnBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.tOnBoardingImage3,

                title: TTexts.tOnBoardingTitle3,
                subtitle: TTexts.tOnBoardingSubTitle3,
              ),
            ],
          ),
          const SkipButton(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          devtools.log('next button');
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),

          backgroundColor: Colors.black,
        ),
        child: Icon(Iconsax.arrow_right_3, color: TColors.white),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipOnBoarding(),
        child: Text('skip'),
      ),
    );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      left: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      child: SmoothPageIndicator(
        onDotClicked: (index) => controller.dotNavigationClick(index),

        controller: controller.pageController,

        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: isDark ? TColors.accent : TColors.dark,
        ),
      ),
    );
  }
}
