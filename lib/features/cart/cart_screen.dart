import 'package:my_store/features/cart/widgets/cart_items.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: textTheme.headlineSmall)),
      body: CartItems(showAddQuantity: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('Check Out')),
      ),
    );
  }
}
