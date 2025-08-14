import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/authentication/screens/verify_email_screen/verify_email_screen.dart';
import 'package:my_store/personalization/models/user_model.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/exports.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';
import 'dart:developer' as devtool;

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  // TextField Controllers to get data from TextFields

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final fullName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;

  // As in the AuthenticationRepository we are calling _setScreen() Method
  // so, whenever there is change in the user state(), screen will be updated.
  // Therefore, when new user is authenticated, AuthenticationRepository() detects
  // the change and call _setScreen() to switch screens

  /// Register New User using either [EmailAndPassword] OR [PhoneNumber] authentication

  toggleObscureText() {
    hidePassword.value = !hidePassword.value;
  }

  toggleCheckBox() {
    privacyPolicy.value = !privacyPolicy.value;
  }

  Future<void> signup() async {
    try {
      devtool.log('Start Sign Up');
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Register user in the Firebase Authentication & Save user data in the Firebase
      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // final token = await TNotificationService.getToken();

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: AuthenticationRepository.instance.getUserID,
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        deviceToken: '', //token missing,
        isEmailVerified: false,
        isProfileActive: false,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        //verificationStatus: VerificationStatus.§approved,
      );

      final userController = Get.put(UserRepository());
      await userController.saveUserRecord(newUser);

      // Get.put(CreateNotificationController());
      // await CreateNotificationController.instance.createNotification();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Show some Generic Error to the user
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// [PhoneNoAuthentication]
  Future<void> loginWithPhoneNumber(String phoneNo) async {
    try {
      // await AuthenticationRepository.instance.loginWithPhoneNo(phoneNo);
    } catch (e) {
      throw e.toString();
    }
  }
}
