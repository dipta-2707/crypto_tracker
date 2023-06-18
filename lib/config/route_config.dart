import 'package:crypto_tracker/view/pages/home_page.dart';
import 'package:get/get.dart';

import 'bindings/home_page_binding.dart';

class AppRouteConfig {
  static const homePagePath = '/';
  static final pages = [
    // Home Page route configs
    GetPage(
        name: homePagePath,
        page: () => const HomePage(),
        binding: HomePageBinding())
  ];
}
