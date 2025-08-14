import 'package:my_store/features/authentication/controllers/sign_up/sign_up_controller.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class TermsAndCondtion extends StatelessWidget {
  const TermsAndCondtion({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(() {
            return Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.toggleCheckBox(),
              activeColor: TColors.primary,
            );
          }),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'I agree to ', style: textTheme.bodySmall),
              TextSpan(
                text: 'Privacy Policy ',
                style: textTheme.bodyMedium!.apply(
                  color: isDark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? TColors.white : TColors.primary,
                ),
              ),
              TextSpan(text: 'and', style: textTheme.bodySmall),
              TextSpan(
                text: 'Terms of use ',
                style: textTheme.bodyMedium!.apply(
                  color: isDark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? TColors.white : TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
