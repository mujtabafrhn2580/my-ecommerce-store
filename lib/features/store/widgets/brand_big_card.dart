import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';

class TBrandBigCard extends StatelessWidget {
  const TBrandBigCard({super.key, required this.isDark, required this.images});
  final List<String> images;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(0),
      showBorder: true,
      borderColor: TColors.borderDark,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.all(TSizes.spaceBtwItems),
      child: Column(
        children: [
          TBrandCard(isDark: isDark, showBorder: false),
          Row(
            children:
                images.map((image) {
                  return imageShowCaseImage(isDark: isDark, image: image);
                }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget imageShowCaseImage({required bool isDark, required String image}) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
      margin: const EdgeInsets.all(TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
