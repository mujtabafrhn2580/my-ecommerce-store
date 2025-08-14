import 'package:my_store/features/store/widgets/brand_big_card.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';

import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

import 'package:my_store/widgets/icons/shopping_cart_count_icon.dart';

import 'package:my_store/widgets/layouts/grid_layout.dart';
import 'package:my_store/widgets/search_bar/search_bar.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showActions: true,
        showSkipButton: false,

        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [TShoppingCartCountIcon(color: TColors.black)],
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (_, inerboxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,

                floating: true,
                pinned: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    children: [
                      MySearchBar(text: 'Search in Store', isDark: isDark),
                      SizedBox(height: TSizes.spaceBtwItems),

                      // FeaturedBrands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),

                      TGridLayout(
                        mainAxisExtent: 70,
                        itemCount: 4,
                        itemBuilder:
                            (context, index) => TBrandCard(isDark: isDark),
                      ),

                      // Text
                    ],
                  ),
                ),
                bottom: const TabBar(
                  isScrollable: true,
                  overlayColor: WidgetStatePropertyAll(TColors.transparent),
                  labelColor: TColors.primary,
                  labelStyle: TextStyle(fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  indicatorColor: TColors.primary,

                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Brands
                  TBrandBigCard(
                    isDark: isDark,
                    images: [
                      TImages.productImage1,
                      TImages.productImage1,
                      TImages.productImage1,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
