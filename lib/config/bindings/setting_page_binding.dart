import 'package:crypto_tracker/controller/setting_page_controller.dart';
import 'package:get/get.dart';

class SettingPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingPageController>(() => SettingPageController());
  }

}