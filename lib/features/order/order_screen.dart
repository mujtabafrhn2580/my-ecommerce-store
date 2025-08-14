import 'package:my_store/features/order/widgets/order_list_items.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text('My Orders', style: textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(children: [OrderListItems()]),
      ),
    );
  }
}
