import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_store/features/products/widgets/sortable_products.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              //Brand Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TBrandCard(isDark: isDark),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
