import 'package:crypto_tracker/controller/crypto_details_page_controller.dart';
import 'package:get/get.dart';

class CryptoDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CryptoDetailsPageController());
  }
}
