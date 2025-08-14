import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/home/home_screen.dart';
import 'package:my_store/features/profile/profile_screen.dart';
import 'package:my_store/features/store/store_screen.dart';
import 'package:my_store/features/wishlist/wishlist_screen.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/get_alpha_value.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final List<Widget> pages = [
      HomeScreen(),
      StoreScreen(),
      WishlistScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          indicatorColor: TColors.black.withAlpha(getalphaValue(0.1)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: (int index) {
            controller.setSelectedIndex(index);
            controller.pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        );
      }),

      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value) => controller.setSelectedIndex(value),

        children: pages,
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final RxInt _selectedIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  int get selectedIndex => _selectedIndex.value;

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }
}
