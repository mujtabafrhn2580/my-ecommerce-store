import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final textTheme = THelperFunctions.getTextTheme(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: isDark ? TColors.dark : TColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(width: TSizes.spaceBtwItems / 2),
              // Status and Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Processing',
                    style: textTheme.titleMedium!.apply(color: TColors.primary),
                  ),
                  Text('07 Nov 2025', style: textTheme.headlineSmall),
                ],
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          //Row 2
          Row(
            children: [
              Row(
                children: [
                  Icon(Iconsax.tag),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  // Order and Order Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order', style: textTheme.labelMedium),
                      Text('[#256f2]', style: textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Row(
                children: [
                  Icon(Iconsax.calendar),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  // Status and Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipping Date', style: textTheme.labelMedium),
                      Text('07 Nov 2025', style: textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ],
          ),

          //Icon
        ],
      ),
    );
  }
}
