import 'package:flutter/cupertino.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/authentication/controllers/sign_up/verify_email_controller.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.clear),
            onPressed: () => AuthenticationRepository.instance.logout(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                TImages.deliveredEmailIllustration,
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TTexts.tEmailVerificationTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'mujtabafrhn@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.tEmailVerificationSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: Text(TTexts.tResendEmailLink),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
