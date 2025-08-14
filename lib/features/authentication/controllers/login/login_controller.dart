import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/exports.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// [ObscureText]
  void toggleObscureText() {
    hidePassword.value = !hidePassword.value;
  }

  /// [Remember Me]
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  /// [EmailAndPasswordLogin]
  Future<void> emailAndPasswordLogin() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.customToast(message: 'No Internet Connection');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login user using EMail & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //Saving the password and email
      if (rememberMe.value) {
        await localStorage.write('REMEMBER_ME_EMAIL', email.text);
        await localStorage.write('REMEMBER_ME_PASSWORD', password.text);
      }

      //      final token = await TNotificationService.getToken();
      final userController = Get.put(UserRepository());
      //await  userController.updateUserRecordWithToken(token);
      // Assign user data to RxUser of UserController to use in app
      //await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect(
        userCredentials.user,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// [GoogleSignInAuthentication]
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.formAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Sign In with Google
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //final userController = Get.put(UserController());
      // Save Authenticated user data in the Firebase Firestore
      // await userController.saveUserRecord(userCredentials: userCredentials);

      // Get.put(CreateNotificationController());
      //await CreateNotificationController.instance.createNotification();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect(
        userCredentials?.user,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
