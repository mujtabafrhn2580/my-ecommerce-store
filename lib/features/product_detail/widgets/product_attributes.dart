import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/chips/rounded_choice_chips.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/texts/section_heading.dart';
import 'package:my_store/widgets/texts/t_product_price_text.dart';
import 'package:my_store/widgets/texts/t_product_title_text.dart';
import 'package:readmore/readmore.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        children: [
          // Selected Attributes pricing and description
          TRoundedContainer(
            backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
            child: Column(
              children: [
                // Title Stack Staus and Price
                Row(
                  children: [
                    const TSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    //Actual Price
                    Column(
                      children: [
                        Row(
                          children: [
                            const TProductTitleText(
                              title: 'Price : ',
                              smallSize: true,
                            ),
                            Text(
                              '\$25',
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            //SalePrice
                            const SizedBox(width: TSizes.spaceBtwItems),
                            TProductPriceText(price: '20'),
                          ],
                        ),
                        Row(
                          children: [
                            TProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                //Varation Description
                TProductTitleText(
                  title:
                      'This is the variation description it can max got to 4 lines',
                  maxLines: 4,
                  smallSize: true,
                ),
              ],
            ),
          ),
          //Attribustes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(title: 'Color', showActionButton: false),
              Wrap(
                spacing: 8,
                children: [
                  SizedBox(height: TSizes.spaceBtwItems),
                  TChoiceChip(text: 'Blue', selected: true),
                  TChoiceChip(text: 'Red', selected: true),
                  TChoiceChip(text: 'Green', selected: true),
                ],
              ),
            ],
          ),
          //Size Attribute
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: 'Size', showActionButton: false),
              Wrap(
                spacing: 8,
                children: [
                  TChoiceChip(text: 'EU 34', selected: true),
                  TChoiceChip(text: 'EU 34', selected: false),
                  TChoiceChip(text: 'EU 34', selected: false),
                  TChoiceChip(text: 'EU 34', selected: false),
                  TChoiceChip(text: 'EU 34', selected: false),
                ],
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          TSectionHeading(title: 'Description', showActionButton: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          const ReadMoreText(
            'This a product description, This a product description,This a product description,This a product description,This a product description,This a product description,',
            trimMode: TrimMode.Line,
            trimCollapsedText: ' show more',
            trimExpandedText: ' show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          //Review
          const Divider(),
          Row(
            children: [
              TSectionHeading(title: 'Reviews(199)', showActionButton: false),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_3)),
            ],
          ),
        ],
      ),
    );
  }
}
