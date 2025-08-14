import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/profile/widgets/profile_tile.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:my_store/widgets/list_tile/settings_list_tile.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),

        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    showActions: true,
                    showSkipButton: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: TColors.textWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  UserProfileTile(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  TSettingsTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set shopping delivery address',
                  ),
                  TSettingsTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                  ),
                  TSettingsTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress completed orders',
                  ),
                  TSettingsTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to regestired bank account',
                  ),
                  TSettingsTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                  ),
                  TSettingsTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                  ),
                  TSettingsTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data useage and connected accounts',
                  ),
                  //App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  TSettingsTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set reccomendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Sarch rusult is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data useage and connected accounts',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            //Button
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => AuthenticationRepository.instance.logout(),
                  child: Text('Logout'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
