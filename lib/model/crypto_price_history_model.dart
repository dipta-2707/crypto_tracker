import 'dart:convert';

class CryptoPriceHistoryModel {
  final double price;
  final int timestamp;

  CryptoPriceHistoryModel({
    required this.price,
    required this.timestamp,
  });

  factory CryptoPriceHistoryModel.fromRawJson(String str) =>
      CryptoPriceHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CryptoPriceHistoryModel.fromJson(Map<String, dynamic> json) =>
      CryptoPriceHistoryModel(
        price: json["price"].toDouble(),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "timestamp": timestamp,
      };
}
