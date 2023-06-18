import 'package:crypto_tracker/api/app_api.dart';
import 'package:crypto_tracker/model/crypto_market_chart_model.dart';
import 'package:get/get.dart';

import '../model/crypto_data_model.dart';
import 'crypto_chart_abstract.dart';

class CryptoDetailsPageController extends GetxController
    implements CryptoChartAbstract {
  late String cryptoName;

  @override
  RxList<List<double>> cryptoMarketHistoryDataList = <List<double>>[].obs;

  @override
  void onInit() {
    isChartDataLoading.value = true;
    super.onInit();
    CryptoDataModel cryptoDataModel = Get.arguments;
    cryptoName = cryptoDataModel.id;
    getMarketHistoryData(cryptoName: cryptoName, days: '1');
  }

  // fetch market history data
  void getMarketHistoryData(
      {required String cryptoName, required String days}) {
    isChartDataLoading.value = true;
    this.cryptoName = cryptoName;
    AppApi.getMarketChartData(cryptoName: cryptoName, days: days).then((value) {
      cryptoMarketHistoryDataList.value = value;
      isChartDataLoading.value = false;
    });
  }

  @override
  void onDayChange(String day) {
    getMarketHistoryData(cryptoName: cryptoName, days: day);
  }

  @override
  RxBool isChartDataLoading = true.obs;
}
