import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/sign_up/sign_up_controller.dart';
import 'package:my_store/features/authentication/screens/login/widgets/authentication_provider_widget.dart';
import 'package:my_store/features/authentication/screens/login/widgets/terms_and_condtion.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/validators/validation.dart';
import 'package:my_store/widgets/form/form_divider_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,

                  TTexts.signupScreenTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              Form(
                key: controller.signupFormKey,
                child: Column(
                  spacing: TSizes.spaceBtwInputFields,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator:
                                (value) => TValidator.validateEmptyText(
                                  'First Name',
                                  value,
                                ),
                            controller: controller.firstName,
                            decoration: InputDecoration(
                              labelText: TTexts.tFirstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        SizedBox(width: TSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            validator:
                                (value) => TValidator.validateEmptyText(
                                  'Last Name',
                                  value,
                                ),
                            controller: controller.lastName,
                            decoration: InputDecoration(
                              labelText: TTexts.tLastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (value) => TValidator.validateUsername(value),
                      controller: controller.userName,
                      decoration: InputDecoration(
                        labelText: TTexts.tUsername,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    TextFormField(
                      validator: (value) => TValidator.validateEmail(value),
                      controller: controller.email,
                      decoration: InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),

                    TextFormField(
                      validator:
                          (value) => TValidator.validatePhoneNumber(value),
                      controller: controller.phoneNumber,
                      decoration: InputDecoration(
                        labelText: TTexts.tPhoneNumber,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    Obx(() {
                      final hidePassword = controller.hidePassword.value;
                      return TextFormField(
                        validator:
                            (value) => TValidator.validatePassword(value),
                        controller: controller.password,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: TTexts.password,
                          prefixIcon: IconButton(
                            icon: Icon(
                              hidePassword ? Iconsax.eye_slash : Iconsax.eye,
                            ),
                            onPressed: () => controller.toggleObscureText(),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TermsAndCondtion(),
              const SizedBox(height: TSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.signup();
                  },
                  child: Text(TTexts.tCreateAccount),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDividerWidget(isSignUp: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              AuthenticationProviderWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
