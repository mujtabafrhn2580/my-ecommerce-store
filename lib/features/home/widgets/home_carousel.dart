import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:my_store/controllers/home_controller.dart';

import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/widgets/custom_shapes/containers/circular_container.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class THomeScreenCarousel extends StatelessWidget {
  const THomeScreenCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeCarouselController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            items: [
              TRoundedImage(imageUrl: TImages.promoBanner1),
              TRoundedImage(imageUrl: TImages.promoBanner2),
              TRoundedImage(imageUrl: TImages.promoBanner3),
            ],

            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.updateCarouselIndex(index);
              },
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          Obx(() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                for (var i = 0; i < 3; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor:
                        controller.carouselIndex.value == i
                            ? TColors.primary
                            : TColors.grey,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
