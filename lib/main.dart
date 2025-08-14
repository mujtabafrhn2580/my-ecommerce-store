import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/bindings/general_bindings.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:my_store/features/brands/all_brands_screen.dart';
import 'package:my_store/features/product_detail/brand_products.dart';
import 'package:my_store/firebase_options.dart';
import 'package:my_store/utils/theme/theme.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Get X local storage
  await GetStorage.init();
  // Preserve Splash screen until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,

      home: OnBoardingScreen(),
    );
  }
}
