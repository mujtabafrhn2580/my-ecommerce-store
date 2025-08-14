import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/images/t_circular_image.dart';
import 'package:my_store/widgets/texts/section_heading.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showActions: false,
        showSkipButton: false,
        showBackArrow: true,

        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Profile Screen
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TCircularImage(
                      image: TImages.tUserProfileImage,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TextButton(
                    onPressed: () {},
                    child: Text('Change Profile Picture'),
                  ),
                ],
              ),
              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onTap: () {}, title: 'Name', value: 'M.Mujtaba'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: 'Username', value: 'M.Mujtaba'),
              const SizedBox(height: TSizes.spaceBtwSections),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                onTap: () {},
                title: 'User ID',
                value: '45689',
                icon: Iconsax.copy,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: 'E-mail', value: 'M.Mujtaba'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                onTap: () {},
                title: 'Phone Number',
                value: '+92-322-0679060',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: 'Gender', value: 'male'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: 'Date of Birth', value: 'male'),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: TColors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.icon = Iconsax.arrow_right_34,
  });
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.apply(
              fontSizeDelta: 2,
              fontWeightDelta: 2,
              color: TColors.darkGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.darkerGrey,
              fontWeightDelta: 8,
              fontSizeDelta: 2,
            ),
          ),
        ),
        Expanded(child: Icon(icon, size: 18)),
      ],
    );
  }
}
