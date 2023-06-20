import 'package:crypto_tracker/utilities/share_pref.dart';
import 'package:get/get.dart';

import '../constants/app_share_pref_key_conts.dart';
import 'home_page_controller.dart';

class SettingPageController extends GetxController {
  RxInt _apiDuration = 5.obs;
  int get apiDuration => _apiDuration.value;

  void putApiDuration(int value) => _apiDuration.value = value;

  // get home controller object
  HomePageController _homePageController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    _apiDuration.value =
        await AppSharePref.getIntData(APPKeyConsts.apiFetchIntervalKey);
  }

  void updateApiDuration() {
    _homePageController.fetchCryptoData(intervalTime: _apiDuration.value);
    AppSharePref.putIntData(
        APPKeyConsts.apiFetchIntervalKey, _apiDuration.value);
  }
}
