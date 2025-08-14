import 'package:my_store/features/home/widgets/home_carousel.dart';
import 'package:my_store/features/home/widgets/home_screen_header.dart';

import 'package:my_store/utils/imports/common_imports.dart';

import 'package:my_store/widgets/layouts/grid_layout.dart';
import 'package:my_store/widgets/product_card/product_card_vertical.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenHeader(),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: THomeScreenCarousel(),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: TSectionHeading(title: 'Popular Products'),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TGridLayout(
              itemCount: 7,
              itemBuilder: (context, index) => TProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
