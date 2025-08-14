import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/add_quantity/add_quantity.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';
import 'package:my_store/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:my_store/widgets/texts/t_product_price_text.dart';
import 'package:my_store/widgets/texts/t_product_title_text.dart';

class CartScreenTile extends StatelessWidget {
  const CartScreenTile({super.key, required this.showAddQuantity});
  final bool showAddQuantity;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final textTheme = THelperFunctions.getTextTheme(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Column(
        children: [
          Row(
            children: [
              TRoundedImage(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(TSizes.sm),

                imageUrl: TImages.productImage10,
                backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    Flexible(
                      child: TProductTitleText(
                        title: 'Red Sports shoes',
                        maxLines: 1,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Colors ', style: textTheme.bodySmall),
                          TextSpan(text: 'Green ', style: textTheme.bodyLarge),
                          TextSpan(text: 'Size ', style: textTheme.bodySmall),
                          TextSpan(text: 'UK 08 ', style: textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    if (showAddQuantity)
                      Row(
                        children: [
                          AddQuantityWidget(
                            minusIconBackgroundColor: TColors.grey,
                            plusIconBackgroundColor: TColors.primary,
                            minusIconColor: TColors.black,
                          ),
                          Spacer(),
                          TProductPriceText(price: '256'),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
