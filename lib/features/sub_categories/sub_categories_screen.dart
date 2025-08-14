import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/images/t_rounded_image.dart';
import 'package:my_store/widgets/product_card/product_card_horizontal.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports Shirts', style: textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // Sub-Categories
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Container(
                    height: 120,
                    color: TColors.white,

                    child: ListView.separated(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemBuilder: (context, index) => ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
