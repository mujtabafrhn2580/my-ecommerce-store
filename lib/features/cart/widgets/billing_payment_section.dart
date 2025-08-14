import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final textTheme = THelperFunctions.getTextTheme(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          showActionButton: true,

          buttonTitle: 'Change',
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              height: 50,
              backgroundColor: isDark ? TColors.light : TColors.white,
              child: Image.asset(TImages.paypal, fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              'Paypal',
              style: textTheme.bodyLarge!.apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ],
    );
  }
}
