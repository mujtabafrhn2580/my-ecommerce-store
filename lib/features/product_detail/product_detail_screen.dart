import 'package:my_store/features/product_detail/bottom_add_to_cart.dart';
import 'package:my_store/features/product_detail/widgets/product_attributes.dart';
import 'package:my_store/features/product_detail/widgets/product_detail_image.dart';

import 'package:my_store/features/product_detail/widgets/product_meta_data.dart';
import 'package:my_store/features/product_detail/widgets/rating_share_row.dart';

import 'package:my_store/utils/imports/common_imports.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetaileImage(isDark: isDark),

            //Rating and share button
            RatingShareRow(),
            // Price Title Brand
            TProductMetaData(),
            // Attributes
            ProductAttributes(),
          ],
        ),
      ),
    );
  }
}
