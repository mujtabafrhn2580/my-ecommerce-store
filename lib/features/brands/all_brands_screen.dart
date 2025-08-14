import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/layouts/grid_layout.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brands', style: textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          children: [
            TSectionHeading(title: 'Brands'),
            SizedBox(height: TSizes.spaceBtwItems),
            Expanded(
              child: TGridLayout(
                itemCount: 4,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(isDark: isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
