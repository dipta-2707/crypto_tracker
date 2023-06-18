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
      "per_page": "50",
      "page": "1",
      "sparkline": "false",
      "local": "en",
    };
    final response = await dio.get(AppApiPathConstants.marketCryptoData,
        queryParameters: param);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CryptoDataModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
