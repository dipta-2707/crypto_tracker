import 'package:dio/dio.dart';

class AppApiConfig {
  static const apiBaseUrl = 'https://api.coingecko.com/api/v3/coins/';
  static final dioConfig = BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );
}
