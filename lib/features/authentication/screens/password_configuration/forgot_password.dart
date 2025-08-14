import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/utils/validators/validation.dart';
import 'package:my_store/widgets/appbar/appbar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    // final ForgotPasswordController controller =
    //     ForgotPasswordController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        showActions: true,

        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.clear, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.tForgetPasswordSubTitle,

              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems * 2),
            Form(
              key: controller.forgotPasswordFormKey,

              child: TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: InputDecoration(
                  labelText: TTexts.tEmail,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: Text(TTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
