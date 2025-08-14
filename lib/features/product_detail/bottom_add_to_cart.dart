import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/add_quantity/add_quantity.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? TColors.darkerGrey : TColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      child: Row(
        children: [
          AddQuantityWidget(),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
            ),
            child: Text('Add To Cart'),
          ),
        ],
      ),
    );
  }
}
