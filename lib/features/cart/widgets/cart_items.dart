import 'package:my_store/features/cart/widgets/cart_screen_tile.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, required this.showAddQuantity});
  final bool showAddQuantity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => CartScreenTile(showAddQuantity: showAddQuantity),
      separatorBuilder:
          (context, index) => const SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 4,
    );
  }
}
