import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/helpers/get_alpha_value.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.selectedAddress,
    required this.isDark,
  });
  final bool selectedAddress;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.spaceBtwItems,
      ),
      borderColor:
          selectedAddress
              ? Colors.transparent
              : isDark
              ? TColors.darkerGrey
              : TColors.darkGrey,
      backgroundColor:
          selectedAddress
              ? TColors.primary.withAlpha(getalphaValue(0.6))
              : Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,

              color:
                  selectedAddress
                      ? !isDark
                          ? TColors.dark.withAlpha(getalphaValue(0.8))
                          : TColors.light
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: TSizes.sm / 2),
              const Text('(123) 456 7890', overflow: TextOverflow.ellipsis),
              const SizedBox(height: TSizes.sm / 2),
              Text('82356 Timmy Caves, South Liana, Maine, USA'),
            ],
          ),
        ],
      ),
    );
  }
}
