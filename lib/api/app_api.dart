import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_tracker/model/crypto_market_chart_model.dart';
import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../constants/app_api_path_constants.dart';
import '../model/crypto_data_model.dart';
import '../model/crypto_price_history_model.dart';

class AppApi {
  // init the dio
  static final dio = Dio(AppApiConfig.dioConfig);

  // access firestore
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<CryptoDataModel>> getCryptoMarketData() async {
    final param = {
      "vs_currency": "usd",
      "order": "market_cap_desc",
      "per_page": "45",
      "page": "1",
      "sparkline": "false",
      "local": "en",
    };

    try {
      final response = await dio.get(AppApiPathConstants.marketCryptoData,
          queryParameters: param);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CryptoDataModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } on DioException catch (e) {
      return [];
    }
  }

  // fetch crypto history price chart data
  static Future<List<List<double>>> getMarketChartData(
      {required String cryptoName, required String days}) async {
    final param = {
      "vs_currency": "usd",
      "days": days,
    };
    final response =
        await dio.get('/$cryptoName/market_chart', queryParameters: param);

    if (response.statusCode == 200) {
      return CryptoMarketChartModel.fromJson(response.data).prices;
    } else {
      return [];
    }
  }

  // fetch crypto history price for last 6 hours from firebase
  static Future<List<CryptoPriceHistoryModel>> getCryptoHistoryData(
      CryptoDataModel cryptoDataModel) async {
    final result = await firestore
        .collection('cryptocurrencieshistory')
        .doc(cryptoDataModel.id)
        .collection('historydata')
        .get();

    return result.docs
        .map((e) => CryptoPriceHistoryModel.fromJson(e.data()))
        .toList();
  }

  // save api result in firebase
  static Future<void> saveCryptoData(CryptoDataModel cryptoDataModel) async {
    await firestore
        .collection('cryptocurrencieshistory')
        .doc(cryptoDataModel.id)
        .collection('historydata')
        .doc()
        .set({
      'price': cryptoDataModel.currentPrice,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
