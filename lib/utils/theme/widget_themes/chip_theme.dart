import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._(); // Fixed constructor

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: TColors.black),
    selectedColor: TColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: TColors.darkGrey, // Replace with actual dark grey
    labelStyle: const TextStyle(color: TColors.white),
    selectedColor: TColors.primary, // Replace with TColors.primary if defined
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TColors.white,
    surfaceTintColor: Colors.transparent,
  );
}
