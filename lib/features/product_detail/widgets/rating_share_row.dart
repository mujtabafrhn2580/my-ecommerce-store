import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class RatingShareRow extends StatelessWidget {
  const RatingShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Iconsax.star5, color: Colors.amber),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(text: '(199)'),
                  ],
                ),
              ),

              //Share Button
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.share, size: TSizes.iconMd),
          ),
        ],
      ),
    );
  }
}
