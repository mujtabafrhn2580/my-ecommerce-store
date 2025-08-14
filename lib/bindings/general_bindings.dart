import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/authentication/controllers/login/login_controller.dart';
import 'package:my_store/features/authentication/controllers/on_boarding/on_boarding_controller.dart';
import 'package:my_store/features/authentication/controllers/sign_up/sign_up_controller.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core
    Get.put(NetworkManager());

    /// -- Repository
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    // Get.put(CartController());
    // Get.put(ThemeController());
    // Get.put(ProductController());
    // Get.lazyPut(() => UserController());
    // Get.lazyPut(() => CheckoutController());
    // Get.lazyPut(() => AddressController());

    Get.lazyPut(() => OnBoardingController(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    //   Get.lazyPut(() => OTPController(), fenix: true);
    //   Get.put(TNotificationService());
    //   Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
