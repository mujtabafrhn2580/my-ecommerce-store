import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/get_alpha_value.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/images/t_circular_image.dart';
import 'package:my_store/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:my_store/widgets/texts/t_product_price_text.dart';
import 'package:my_store/widgets/texts/t_product_title_text.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Price and Sale tag
          Row(
            spacing: TSizes.spaceBtwItems,
            children: [
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withAlpha(
                  getalphaValue(0.8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm,
                  vertical: TSizes.xs,
                ),
                child: Text(
                  '25%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: TColors.black),
                ),
              ),

              // Price
              Text(
                "\$250",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),

              TProductPriceText(price: '175', isLarge: true),
            ],
          ),
          //Title
          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
          const TProductTitleText(title: 'Green Nike sports shirt'),
          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
          //Stock Status
          Row(
            children: [
              const TProductTitleText(title: 'Status  ', smallSize: false),

              Text(
                'In Stock',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(fontWeightDelta: 2),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
          //Brand
          Row(
            children: [
              TCircularImage(
                image: TImages.cosmeticsIcon,
                width: 32,
                height: 32,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
            ],
          ),
        ],
      ),
    );
  }
}
