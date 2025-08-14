import 'package:my_store/features/products/widgets/sortable_products.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products', style: textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(child: TSortableProducts()),
    );
  }
}
