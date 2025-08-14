import 'package:flutter/widgets.dart';
import 'package:my_store/utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry addingWithAppbarheight = EdgeInsets.only(
    top: TSizes.appBarHeight, // Assuming app bar height is 56.0
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
}
