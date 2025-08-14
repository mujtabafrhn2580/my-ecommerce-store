import 'package:flutter/material.dart';
import 'package:my_store/features/product_review/widgets/rating_bar_indicator.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/utils/logging/logger.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(child: Image.asset(TImages.tUserProfileImage)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('John Doe', style: textTheme.headlineSmall),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            TRatingBarIndicator(rating: 4.2),
            Text('01 Nov, 2023', style: textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          'The user Interface of this app is very intuitive. I was able to naviagte and make purchases easily. I really enjoyed this app. The products from this store was amazing this is the best.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
            color: TColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          lessStyle: TextStyle(
            color: TColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //Company Review
        TRoundedContainer(
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mujtaba\'s store', style: textTheme.titleMedium),
                Text('02 Nov, 2025', style: textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
