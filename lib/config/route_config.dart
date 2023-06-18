import 'package:crypto_tracker/config/bindings/setting_page_binding.dart';
import 'package:crypto_tracker/view/pages/crypto_details_page.dart';
import 'package:crypto_tracker/view/pages/home_page.dart';
import 'package:crypto_tracker/view/pages/setting_page.dart';
import 'package:get/get.dart';

import 'bindings/crypto_details_page_binding.dart';
import 'bindings/home_page_binding.dart';

class AppRouteConfig {
  static const homePagePath = '/';
  static const cryptoDetailsPagePath = '/crypto_details_page';
  static const settingPagePath = '/setting_page';
  static final pages = [
    // Home Page route configs
    GetPage(
        name: homePagePath,
        page: () => const HomePage(),
        binding: HomePageBinding()),
    // Crypto Details Page route configs
    GetPage(
        name: cryptoDetailsPagePath,
        page: () => CryptoDetailsPage(cryptoDataModel: Get.arguments),
        binding: CryptoDetailsPageBinding()),

    // setting page route config
    GetPage(name:settingPagePath , page: ()=>const SettingPage(),
    binding: SettingPageBinding(),
    transition: Transition.cupertino
    )
  ];
}
