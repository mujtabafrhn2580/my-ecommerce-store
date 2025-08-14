import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/address/widgets/address_tile.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: TColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        ),
        child: Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showActions: false,
        showSkipButton: false,
        showBackArrow: true,

        title: Text('Address', style: textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressTile(selectedAddress: true, isDark: isDark),
            AddressTile(selectedAddress: false, isDark: isDark),
            AddressTile(selectedAddress: false, isDark: isDark),
          ],
        ),
      ),
    );
  }
}
