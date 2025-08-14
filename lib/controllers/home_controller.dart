import 'package:get/get.dart';

class HomeCarouselController extends GetxController {
  static HomeCarouselController get instance => Get.find();
  final carouselIndex = 0.obs;

  void updateCarouselIndex(int index) {
    carouselIndex.value = index;
  }
}
