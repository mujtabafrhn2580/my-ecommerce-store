import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/widgets/custom_shapes/containers/circular_container.dart';

class TShoppingCartCountIcon extends StatelessWidget {
  const TShoppingCartCountIcon({super.key, this.color = TColors.white});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(size: 25, Iconsax.shopping_bag, color: color),
        ),
        Positioned(
          right: 0,
          child: TCircularContainer(
            backgroundColor: TColors.black.withAlpha((0.8 * 255).toInt()),
            width: 18,
            height: 18,
            child: Text(
              '2',
              style: Theme.of(context).textTheme.labelLarge!.apply(
                color: TColors.white,
                fontSizeFactor: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
