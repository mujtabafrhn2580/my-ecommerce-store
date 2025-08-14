import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: TColors.grey,
      rating: rating,
      itemSize: 20,
      itemBuilder: (context, index) {
        return Icon(Iconsax.star1, color: TColors.primary);
      },
    );
  }
}
