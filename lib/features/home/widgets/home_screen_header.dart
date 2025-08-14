import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/features/home/widgets/home_app_bar.dart';
import 'package:my_store/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:my_store/widgets/image_text/image_text_vertical.dart';
import 'package:my_store/widgets/search_bar/search_bar.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TPrimaryHeaderContainer(
      child: Column(
        children: [
          THomeAppBar(),
          const SizedBox(height: TSizes.spaceBtwSections),
          MySearchBar(text: 'Search in Store', isDark: isDark),

          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                TSectionHeading(
                  title: 'Popular Categories',
                  textColor: TColors.textWhite,
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:
                        (context, index) => TVerticalImageAndText(
                          image: TImages.clothIcon,
                          title: 'clothes',
                        ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
