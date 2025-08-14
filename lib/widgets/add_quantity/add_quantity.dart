import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';

class AddQuantityWidget extends StatelessWidget {
  const AddQuantityWidget({
    super.key,
    this.minusIconBackgroundColor = TColors.darkGrey,
    this.plusIconBackgroundColor = TColors.black,
    this.minusIconColor = TColors.white,
    this.plusIconColor = TColors.white,
  });
  final Color minusIconBackgroundColor;
  final Color plusIconBackgroundColor;
  final Color minusIconColor;
  final Color plusIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 40,
          height: 40,
          backgroundColor: minusIconBackgroundColor,
          color: minusIconColor,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 40,
          height: 40,
          backgroundColor: plusIconBackgroundColor,
          color: plusIconColor,
        ),
      ],
    );
  }
}
