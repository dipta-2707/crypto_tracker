import 'package:get/get.dart';

import '../model/crypto_market_chart_model.dart';

abstract class CryptoChartAbstract {
  abstract RxBool isChartDataLoading;
  // history record data list
  abstract RxList<List<double>> cryptoMarketHistoryDataList;

  // to fetch data of 24, 7d, 14d or 30d
  void onDayChange(String day);
}
