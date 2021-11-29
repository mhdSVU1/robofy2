import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool signInWidgetIsDisplayed = true.obs;

  changelogInIsDisplayed() {
    print("changelogInIsDisplayed");
    signInWidgetIsDisplayed.value = !signInWidgetIsDisplayed.value;
  }
}
