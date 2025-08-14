import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/authentication/screens/password_configuration/reset_password_screen.dart';

import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/exports.dart';
import 'package:my_store/utils/popups/exports.dart';
import 'dart:developer' as devtools;

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();
  final email = TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  //Send Reset pasword email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request',
        TImages.formAnimation,
      );
      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      devtools.log(isConnected.toString());

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        devtools.log('It is not connected');
        return;
      }
      //Form Validation
      devtools.log('Should call form Validation');
      final isFormValid = forgotPasswordFormKey.currentState!.validate();
      devtools.log('${isFormValid} Form validation');
      devtools.log('Should Form isValid');
      if (!isFormValid) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link sent to reset you email password'.tr,
      );

      TFullScreenLoader.stopLoading();

      Get.to(() => ResetPasswordScreen(email: email.text));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: e.toString());
    }
  }

  resendPasswordEmail() async {
    final isConnected = await NetworkManager.instance.isConnected();

    devtools.log(isConnected.toString());

    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      devtools.log('It is not connected');
      return;
    }
    await AuthenticationRepository.instance.sendPasswordResetEmail(
      email.text.trim(),
    );

    TLoaders.successSnackBar(
      title: 'Email Sent',
      message: 'Email Link sent to reset you email password'.tr,
    );
  }
}
