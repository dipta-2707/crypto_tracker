import 'package:get/get.dart';

import '../../controller/crypto_chart_controller.dart';

class CryptoChartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptoChartController>(() => CryptoChartController());
  }
}
