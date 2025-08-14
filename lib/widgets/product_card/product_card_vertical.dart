import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/get_alpha_value.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';
import 'package:my_store/widgets/styles/shadows.dart';
import 'package:my_store/widgets/texts/t_product_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 180,

      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: isDark ? TColors.darkGrey : TColors.white,
      ),
      child: Column(
        children: [
          //ThumbNail
          ThumbNailImage(isDark: isDark),

          TProductTitleText(title: 'Nike Green Shoes', smallSize: true),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
            child: Row(
              children: [
                Text(
                  'Nike',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(width: TSizes.sm),
                const Icon(
                  Iconsax.verify5,
                  color: TColors.primary,
                  size: TSizes.iconXs,
                ),
              ],
            ),
          ),

          //Price
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                child: Text(
                  '35.5',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: TColors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Spacer(),
              Container(
                height: TSizes.iconLg * 1.2,
                width: TSizes.iconLg * 1.2,

                decoration: BoxDecoration(
                  color: TColors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.productImageRadius),
                    bottomRight: Radius.circular(TSizes.productImageRadius),
                  ),
                ),
                child: Icon(Iconsax.add, color: TColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThumbNailImage extends StatelessWidget {
  const ThumbNailImage({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 180,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: isDark ? TColors.dark : TColors.light,

      child: Stack(
        children: [
          TRoundedImage(
            imageUrl: TImages.productImage1,
            applyImageRadius: true,
          ),
          Positioned(
            top: 12,
            child: TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withAlpha(getalphaValue(0.8)),
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
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                color:
                    isDark
                        ? TColors.black.withAlpha(getalphaValue(0.1))
                        : TColors.white.withAlpha(getalphaValue(0.1)),
              ),
              child: TCircularIcon(
                icon: Iconsax.heart5,
                size: 25,
                color: TColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
