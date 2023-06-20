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

  RxInt _selectedDayIndex = 0.obs;

  int get selectedDayIndex => _selectedDayIndex.value;

  void setSelectedDayIndex(int index) {
    _selectedDayIndex.value = index;
  }

  // last 6 hours average price
  RxDouble _cryptoAverageHistoryPrices = 0.0.obs;
  double get cryptoAverageHistoryPrices => _cryptoAverageHistoryPrices.value;

  @override
  void onInit() {
    isChartDataLoading.value = true;
    super.onInit();
    CryptoDataModel cryptoDataModel = Get.arguments;
    cryptoName = cryptoDataModel.id;
    getMarketHistoryData(cryptoName: cryptoName, days: '1');
    //get crypto history data from firebase
    AppApi.getCryptoHistoryData(cryptoDataModel).then((value) {
      // calculate the average prices for last 6 hours
      final currentTime = DateTime.now();
      int counter = 0;
      for (int i = 0; i < value.length; i++) {
        // last 6 hour
        if (DateTime.fromMillisecondsSinceEpoch(value[i].timestamp)
                .isAfter(currentTime.subtract(const Duration(hours: 6))) &&
            DateTime.fromMillisecondsSinceEpoch(value[i].timestamp)
                .isBefore(currentTime)) {
          _cryptoAverageHistoryPrices.value += value[i].price;
          counter++;
        }
      }
      _cryptoAverageHistoryPrices.value =
          _cryptoAverageHistoryPrices.value / counter;
    });
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
