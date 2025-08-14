import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_store/widgets/images/t_circular_image.dart';
import 'package:my_store/widgets/texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key, required this.isDark, this.showBorder = true});

  final bool isDark;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.sm),
      borderColor:
          showBorder
              ? isDark
                  ? TColors.borderLight
                  : TColors.borderDark
              : Colors.transparent,
      showBorder: true,
      backgroundColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Flexible(
            child: TCircularImage(
              image: TImages.clothIcon,

              isNetworkImage: false,

              overlayColor: !isDark ? TColors.dark : TColors.light,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TBrandTitleWithVerifiedIcon(
                title: 'Nike',
                brandTextSize: TextSizes.large,
              ),
              Text(
                '256 products',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: TColors.darkGrey),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
