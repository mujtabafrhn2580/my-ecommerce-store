import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',

          onPressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text('Home', style: textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            Icon(Icons.phone, color: TColors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),

            Flexible(
              child: const Text(
                '(123) 456 7890',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.sm / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey),
            const SizedBox(width: TSizes.spaceBtwItems),

            Flexible(
              child: Text(
                '82356 Timmy Caves, South Liana, Maine, USA',
                style: textTheme.bodyMedium,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
