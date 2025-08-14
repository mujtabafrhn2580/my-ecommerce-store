import 'package:my_store/utils/helpers/get_alpha_value.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';

class CouponField extends StatelessWidget {
  const CouponField({super.key, required this.isDark, required this.textTheme});

  final bool isDark;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: TRoundedContainer(
        borderColor: TColors.darkGrey,
        showBorder: true,
        backgroundColor: isDark ? TColors.dark : TColors.white,
        padding: const EdgeInsets.fromLTRB(
          TSizes.md,
          TSizes.sm,
          TSizes.sm,
          TSizes.sm,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  hintStyle: textTheme.headlineSmall!.apply(fontSizeDelta: 0.8),
                  focusedBorder: InputBorder.none,

                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.grey.withAlpha(getalphaValue(0.8)),
                side: BorderSide(color: TColors.transparent),

                foregroundColor:
                    isDark
                        ? TColors.white.withAlpha(getalphaValue(0.5))
                        : TColors.dark.withAlpha(getalphaValue(0.5)),
              ),

              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
