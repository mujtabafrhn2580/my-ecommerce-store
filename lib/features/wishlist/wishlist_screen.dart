import 'package:my_store/utils/imports/common_imports.dart';

import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/home/home_screen.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';
import 'package:my_store/widgets/layouts/grid_layout.dart';

import 'package:my_store/widgets/product_card/product_card_vertical.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
        showActions: true,
        showSkipButton: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TProductCardVertical();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
