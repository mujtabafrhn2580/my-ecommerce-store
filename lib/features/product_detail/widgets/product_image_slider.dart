import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 30,
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return TRoundedImage(
              width: 80,
              backgroundColor: isDark ? TColors.dark : TColors.white,
              border: Border.all(color: TColors.primary),
              imageUrl: TImages.productImage1,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: TSizes.spaceBtwItems);
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
