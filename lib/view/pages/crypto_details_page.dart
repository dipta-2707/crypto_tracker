import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker/controller/crypto_details_page_controller.dart';
import 'package:crypto_tracker/model/crypto_data_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/crypto_chart_widget.dart';

class CryptoDetailsPage extends GetView<CryptoDetailsPageController> {
  final CryptoDataModel cryptoDataModel;
  const CryptoDetailsPage({Key? key, required this.cryptoDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Details'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // General info
              Row(
                children: [
                  // currency image
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: const Color(0xff3F3E45)),
                    child: CachedNetworkImage(
                      imageUrl: cryptoDataModel.image,
                      width: 120.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  // currency general details
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cryptoDataModel.name,
                          style: Get.textTheme.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          cryptoDataModel.symbol.toUpperCase(),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          cryptoDataModel.currentPrice.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                            '${double.parse(cryptoDataModel.priceChangePercentage24H.toStringAsFixed(3))}%'),
                        SizedBox(height: 8.h),
                        Text(
                          'last Update: ${DateFormat.yMd().format(cryptoDataModel.lastUpdated)}',
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              // price chart
              SizedBox(
                height: 250.h,
                width: double.infinity,
                child: CryptoChartWidget(),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: () {}, child: const Text('24h')),
                  OutlinedButton(onPressed: () {}, child: const Text('7d')),
                  OutlinedButton(onPressed: () {}, child: const Text('14d')),
                  OutlinedButton(onPressed: () {}, child: const Text('30d')),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailsContainer(
                      title: 'Ranking',
                      value: cryptoDataModel.marketCapRank.toString()),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _detailsContainer(
                        title: 'Market Capitalization',
                        value: cryptoDataModel.marketCap.toString()),
                  ),
                  // SizedBox(width: 8.w),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                      child: _detailsContainer(
                          title: 'Total Volume',
                          value: cryptoDataModel.totalVolume.toString())),
                  SizedBox(
                    width: 8.w,
                  ),
                  _detailsContainer(
                      title: 'High 24h',
                      value: cryptoDataModel.high24H.toString()),
                  SizedBox(width: 8.w),
                  _detailsContainer(
                      title: 'Low 24h',
                      value: cryptoDataModel.low24H.toString())
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: const Icon(Icons.price_change_outlined),
                  title: 'price_change_24h',
                  value: cryptoDataModel.priceChangePercentage24H.toString()),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: Icon(Icons.attach_money),
                  title: 'market capitalization change 24h',
                  value: cryptoDataModel.marketCapChange24H.toString()),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: const Icon(Icons.loop),
                  title: 'circulating supply',
                  value: cryptoDataModel.circulatingSupply.toString()),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: const Icon(Icons.monetization_on_outlined),
                  title: 'Total supply',
                  value: cryptoDataModel.totalSupply.toString()),
              SizedBox(
                height: 12.h,
              ),
              // all time high
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xff3F3E45),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.arrow_upward_outlined,
                        size: 18.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text('All Time High'),
                      const Spacer(),
                      Text(
                        DateFormat.yMd().format(cryptoDataModel.athDate),
                        style:
                            Get.textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                      )
                    ]),
                    SizedBox(height: 8.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cryptoDataModel.ath.toString()),
                          Text('${cryptoDataModel.athChangePercentage}%')
                        ])
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              // all time low
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xff3F3E45),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.arrow_upward_outlined,
                        size: 18.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text('All Time Low'),
                      const Spacer(),
                      Text(
                        DateFormat.yMd().format(cryptoDataModel.atlDate),
                        style:
                            Get.textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                      )
                    ]),
                    SizedBox(height: 8.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cryptoDataModel.atl.toString()),
                          Text('${cryptoDataModel.atlChangePercentage}%')
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailsContainer(
      {Icon? leadIcon, required String title, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xff3F3E45),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (leadIcon != null) leadIcon,
              if (leadIcon != null) SizedBox(width: 8.h),
              Text(
                title,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
          )
        ],
      ),
    );
  }
}
