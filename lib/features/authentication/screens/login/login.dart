import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/login/login_controller.dart';
import 'package:my_store/features/authentication/screens/login/widgets/authentication_provider_widget.dart';
import 'package:my_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:my_store/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/utils/validators/validation.dart';
import 'package:my_store/widgets/form/form_divider_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.addingWithAppbarheight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(TImages.tWelcomeScreenImage),
                height: 150,
              ),
              Text(
                TTexts.tLoginTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: TSizes.xs),
              Text(
                TTexts.tLoginSubTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: TSizes.spaceBtwSections),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => TValidator.validateEmail(value),
                      controller: controller.email,
                      decoration: InputDecoration(
                        labelText: TTexts.email,

                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Obx(() {
                      final hidePassword = controller.hidePassword.value;
                      return TextFormField(
                        controller: controller.password,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword ? Iconsax.eye_slash : Iconsax.eye,
                            ),
                            onPressed: () => controller.toggleObscureText(),
                          ),
                          prefixIcon: Icon(Iconsax.password_check),
                        ),
                      );
                    }),
                    const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                    Row(
                      children: [
                        Row(
                          children: [
                            Obx(() {
                              return Checkbox(
                                value: controller.rememberMe.value,
                                onChanged:
                                    (value) => controller.toggleRememberMe(),
                                activeColor: TColors.buttonPrimary,
                              );
                            }),
                            Text(TTexts.tRememberMe),
                          ],
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => Get.to(() => ForgotPasswordScreen()),
                          child: Text(
                            TTexts.tForgetPassword,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.emailAndPasswordLogin(),
                        child: const Text(TTexts.tLogin),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: const Text(TTexts.tCreateAccount),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDividerWidget(isSignUp: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              AuthenticationProviderWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
