import 'package:my_store/utils/imports/common_imports.dart';
import 'package:iconsax/iconsax.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.text,
    required this.isDark,
    this.showBackgroundColor = true,
  });

  final String text;
  final bool isDark;
  final bool showBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Container(
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color:
              showBackgroundColor
                  ? isDark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          border: Border.all(color: TColors.grey),
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Search in store',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: TColors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
