import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:my_store/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/appbar/appbar.dart';
import 'package:my_store/widgets/success_screen/success_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final textTheme = THelperFunctions.getTextTheme(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.clear, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.md),

          child: Column(
            children: [
              //Image
              Image.asset(TImages.deliveredEmailIllustration),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Email, Tilte , Subtile
              Text(
                email,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.tResetPassword,
                style: textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Text(
                TTexts.tResetPasswordSubTitle,
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => LoginScreen()),
                  child: Text(TTexts.done),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextButton(
                onPressed:
                    () =>
                        ForgotPasswordController.instance.resendPasswordEmail(),
                child: Text('Resend Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
