import 'package:crypto_tracker/controller/home_page_controller.dart';
import 'package:crypto_tracker/view/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/crypto_list_tile.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker'),
        actions: [
          IconButton(
              onPressed: () {
                controller.toGoSettingPage();
              },
              icon: const Icon(Icons.settings))
        ],
        bottom: PreferredSize(
            child: Obx(() => controller.isRefreshing
                ? LinearProgressIndicator()
                : SizedBox()),
            preferredSize: Size(double.infinity, 0.h)),
      ),
      body: Obx(
        () => !controller.isDataLoading
            ? ListView.builder(
                itemCount: controller.initialDataLength,
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CryptoListTile(
                  cryptoDataModel: controller.cryptoDataList[index],
                  onTap: () => controller.toGoCryptoDetailsPage(
                    cryptoDataModel: controller.cryptoDataList[index],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: ListView.separated(
                  itemCount: 15,
                  itemBuilder: (context, index) =>
                      ShimmerWidget(width: double.infinity, height: 60.h),
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                ),
              ),
      ),
    );
  }
}
