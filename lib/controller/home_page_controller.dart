import 'package:get/get.dart';

import '../api/app_api.dart';
import '../config/route_config.dart';
import '../model/crypto_data_model.dart';

class HomePageController extends GetxController {
  RxList<CryptoDataModel> _cryptoDataList = <CryptoDataModel>[].obs;

  List<CryptoDataModel> get cryptoDataList => _cryptoDataList;

  RxBool _isDataLoading = true.obs;

  bool get isDataLoading => _isDataLoading.value;

  @override
  void onInit() {
    _isDataLoading.value = true;
    super.onInit();
    getCryptoData();
  }

  // fetch market crypto data
  void getCryptoData() {
    AppApi.getCryptoMarketData().then((value) {
      _cryptoDataList.addAll(value);
      _isDataLoading.value = false;
    });
  }

  // route to go crypto details page
  void toGoCryptoDetailsPage() {
    Get.toNamed(AppRouteConfig.cryptoDetailsPagePath);
  }
}
