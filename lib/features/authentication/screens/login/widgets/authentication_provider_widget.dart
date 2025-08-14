import 'package:flutter/material.dart';
import 'package:my_store/features/authentication/controllers/login/login_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AuthenticationProviderWidgets extends StatelessWidget {
  const AuthenticationProviderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: TColors.grey),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: Image.asset(
              width: TSizes.iconSm,
              height: TSizes.iconSm,
              TImages.tGoogleLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // const SizedBox(width: TSizes.spaceBtwSections),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(100),
        //     border: Border.all(color: TColors.grey),
        //   ),
        //   child: IconButton(
        //     onPressed: () => {},
        //     icon: Image.asset(
        //       width: TSizes.iconLg,
        //       height: TSizes.iconLg,
        //       TImages.tFacebookLogo,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
