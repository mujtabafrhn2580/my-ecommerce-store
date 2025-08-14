import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/get_alpha_value.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';
import 'package:my_store/widgets/styles/shadows.dart';
import 'package:my_store/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:my_store/widgets/texts/t_product_price_text.dart';
import 'package:my_store/widgets/texts/t_product_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final textTheme = THelperFunctions.getTextTheme(context);
    return GestureDetector(
      child: Container(
        height: 120,
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.darkerGrey : TColors.white,
        ),
        child: Row(
          children: [
            //ThumbNail
            TRoundedContainer(
              height: 180,
              backgroundColor: isDark ? TColors.dark : TColors.light,
              padding: const EdgeInsets.all(TSizes.sm),

              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                  //Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withAlpha(
                        getalphaValue(0.2),
                      ),
                      child: Text(
                        '25%',
                        style: textTheme.labelLarge!.apply(
                          color: TColors.black,
                        ),
                      ),
                    ),
                  ),
                  //Favourite Icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5),
                  ),
                ],
              ),
            ),

            //Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: 'Green Nike half sleeves shirt',
                          smallSize: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(title: 'Nike'),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        TProductPriceText(price: '25'),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: TSizes.iconLg * 1.2,
                            width: TSizes.iconLg * 1.2,

                            decoration: BoxDecoration(
                              color: TColors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  TSizes.productImageRadius,
                                ),
                                bottomRight: Radius.circular(
                                  TSizes.productImageRadius,
                                ),
                              ),
                            ),
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
