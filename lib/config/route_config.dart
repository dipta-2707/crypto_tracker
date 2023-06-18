import 'package:crypto_tracker/view/pages/crypto_details_page.dart';
import 'package:crypto_tracker/view/pages/home_page.dart';
import 'package:get/get.dart';

import 'bindings/crypto_details_page_binding.dart';
import 'bindings/home_page_binding.dart';

class AppRouteConfig {
  static const homePagePath = '/';
  static const cryptoDetailsPagePath = '/crypto_details_page';
  static final pages = [
    // Home Page route configs
    GetPage(
        name: homePagePath,
        page: () => const HomePage(),
        binding: HomePageBinding()),
    // Crypto Details Page route configs
    GetPage(
        name: cryptoDetailsPagePath,
        page: () => const CryptoDetailsPage(),
        binding: CryptoDetailsPageBinding())
  ];
}
