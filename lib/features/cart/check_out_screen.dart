import 'package:my_store/features/cart/widgets/billing_address_section.dart';
import 'package:my_store/features/cart/widgets/billing_payment_section.dart';
import 'package:my_store/features/cart/widgets/billing_amount_section.dart';
import 'package:my_store/features/cart/widgets/cart_items.dart';
import 'package:my_store/features/cart/widgets/coupon_field.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/custom_shapes/containers/rounded_container.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('Check Out')),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrollable Cart Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: CartItems(showAddQuantity: false),
            ),

            // Promo Code Input - fixed at bottom
            CouponField(isDark: isDark, textTheme: textTheme),
            const SizedBox(height: TSizes.spaceBtwSections),
            //Billing Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: TRoundedContainer(
                backgroundColor: isDark ? TColors.black : TColors.white,
                showBorder: true,
                child: Column(
                  children: [
                    //Pricing
                    BillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    //Payment Method
                    BillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    BillingAddressSection(),

                    //Address
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
