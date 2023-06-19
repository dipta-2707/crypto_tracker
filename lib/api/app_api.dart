import 'package:crypto_tracker/model/crypto_market_chart_model.dart';
import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../constants/app_api_path_constants.dart';
import '../model/crypto_data_model.dart';

class AppApi {
  // init the dio
  static final dio = Dio(AppApiConfig.dioConfig);

  static Future<List<CryptoDataModel>> getCryptoMarketData() async {
    final param = {
      "vs_currency": "usd",
      "order": "market_cap_desc",
      "per_page": "45",
      "page":"1",
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
}
