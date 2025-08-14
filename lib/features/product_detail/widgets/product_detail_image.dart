import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product_detail/widgets/product_image_slider.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:my_store/widgets/icons/t_circular_icon.dart';

class ProductDetaileImage extends StatelessWidget {
  const ProductDetaileImage({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Image(image: AssetImage(TImages.productImage1)),
              ),
            ),
            //Image Slider
            TProductImageSlider(isDark: isDark),
            TAppBar(
              showActions: true,
              showSkipButton: false,
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  size: 25,
                  color: TColors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
