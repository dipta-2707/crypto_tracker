import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker/controller/crypto_details_page_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/crypto_chart_widget.dart';

class CryptoDetailsPage extends GetView<CryptoDetailsPageController> {
  const CryptoDetailsPage({Key? key}) : super(key: key);

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
                      imageUrl: "http://via.placeholder.com/350x150",
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Crypto Name'),
                      SizedBox(height: 8.h),
                      Text('Crypto Symbol'),
                      SizedBox(height: 8.h),
                      Text('Crypto Price'),
                      SizedBox(height: 8.h),
                      Text('Crypto Change %'),
                      SizedBox(height: 8.h),
                      Text('last Update')
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),

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
                  _detailsContainer(title: 'Ranking', value: '1'),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _detailsContainer(
                        title: 'Market Capitalization', value: '1232151232'),
                  ),
                  // SizedBox(width: 8.w),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                      child: _detailsContainer(
                          title: 'Total Volume', value: '1232151232')),
                  SizedBox(
                    width: 8.w,
                  ),
                  _detailsContainer(title: 'High 24h', value: '1.002'),
                  SizedBox(width: 8.w),
                  _detailsContainer(title: 'Low 24h', value: '0.004')
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: Icon(Icons.price_change_outlined),
                  title: 'price_change_24h',
                  value: '-0.001588591574815057'),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: Icon(Icons.attach_money),
                  title: 'market capitalization change 24h',
                  value: '-17178378.819843292'),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: Icon(Icons.loop),
                  title: 'circulating supply',
                  value: '28349063954.4426'),
              SizedBox(
                height: 12.h,
              ),
              _detailsContainer(
                  leadIcon: Icon(Icons.monetization_on_outlined),
                  title: 'Total supply',
                  value: '28349043954.442'),
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
                      Icon(Icons.arrow_upward_outlined),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text('All Time High'),
                      Spacer(),
                      Text('12.08.23')
                    ]),
                    SizedBox(height: 8.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('0.877647'), Text('14.03193%')])
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
                      Icon(Icons.arrow_downward_outlined),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text('All Time Low'),
                      Spacer(),
                      Text('12.08.23')
                    ]),
                    SizedBox(height: 8.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('0.877647'), Text('14.03193%')])
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
