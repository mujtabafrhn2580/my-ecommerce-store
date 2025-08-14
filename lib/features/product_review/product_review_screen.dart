import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product_review/widgets/overall_product_ratings.dart';
import 'package:my_store/features/product_review/widgets/rating_bar_indicator.dart';
import 'package:my_store/features/product_review/widgets/user_review_card.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = THelperFunctions.getTextTheme(context);
    return Scaffold(
      appBar: TAppBar(
        showActions: false,
        showSkipButton: false,
        title: Text('Reviews & String', style: textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and reviews  verified and are from people who use the same type of device that you use',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Over all product Ratings
              OverAllproductRatings(textTheme: textTheme),
              TRatingBarIndicator(rating: 3.5),
              //Number of views
              Text('12,611', style: textTheme.headlineSmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
