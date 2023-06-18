import 'package:get/get.dart';

import '../config/route_config.dart';

class HomePageController extends GetxController {
  // route to go crypto details page
  void toGoCryptoDetailsPage() {
    Get.toNamed(AppRouteConfig.cryptoDetailsPagePath);
  }
}
