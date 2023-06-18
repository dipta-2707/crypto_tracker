import 'dart:convert';

class CryptoMarketChartModel {
  final List<List<double>> prices;

  CryptoMarketChartModel({
    required this.prices,
  });

  factory CryptoMarketChartModel.fromRawJson(String str) =>
      CryptoMarketChartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CryptoMarketChartModel.fromJson(Map<String, dynamic> json) =>
      CryptoMarketChartModel(
        prices: List<List<double>>.from(json["prices"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
      );

  Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(
            prices.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
