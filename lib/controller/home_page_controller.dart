import 'dart:async';

import 'package:crypto_tracker/utilities/share_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/app_api.dart';
import '../config/route_config.dart';
import '../constants/app_share_pref_key_conts.dart';
import '../model/crypto_data_model.dart';

class HomePageController extends GetxController {
  RxList<CryptoDataModel> _cryptoDataList = <CryptoDataModel>[].obs;

  List<CryptoDataModel> get cryptoDataList => _cryptoDataList;

  RxBool _isDataLoading = true.obs;

  //RxBool _isloadingMore = false.obs;

  //bool get isLoadingMore => _isloadingMore.value;

  bool get isDataLoading => _isDataLoading.value;

  // page scroll controller
  ScrollController scrollController = ScrollController();

  // max page number
  // final int _maxPageNumber = 3;
  // int _currentPageNumber = 1;

  /// alter native pagination index
  RxInt _initialDataLength = 15.obs;
  int get initialDataLength => _initialDataLength.value;

  // timer for fetch data in a interval
  Timer? _timer;

  @override
  void onInit() async {
    _isDataLoading.value = true;
    // _isloadingMore.value = false;
    super.onInit();
    getCryptoData();

    // init fetching the data in a default timer of 5 minutes interval
    final time =
        await AppSharePref.getIntData(APPKeyConsts.apiFetchIntervalKey);
    fetchCryptoData(intervalTime: time);

    // init scroll controller listener
    scrollController.addListener(() {
      // reach bottom
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          _initialDataLength.value < 45) {
        /// cant apply this for api call limitation
        // if(_currentPageNumber <= _maxPageNumber && !_isloadingMore.value){
        //   _isloadingMore.value = true;
        //  getCryptoData(pageNumber: _currentPageNumber);
        //   print('calling more data... page no $_currentPageNumber');
        //
        // }
        /// alternative pagination approach
        _initialDataLength += 15;
      }
    });
  }

  // fetch market crypto data
  void getCryptoData() {
    AppApi.getCryptoMarketData().then((value) {
      _cryptoDataList.value = value;
      if (_isDataLoading.value) {
        _isDataLoading.value = false;
      }
      // _isloadingMore.value = false;
    });
  }

  // corn job to fetch data from api
  void fetchCryptoData({required int intervalTime}) {
    _timer?.cancel();
    if (kDebugMode) {
      print('interval $intervalTime');
    }
    _timer = Timer.periodic(Duration(minutes: intervalTime), (timer) {
      getCryptoData();
      if (kDebugMode) {
        print('fetching updated data....');
      }
    });
  }

  // route to go crypto details page
  void toGoCryptoDetailsPage({required CryptoDataModel cryptoDataModel}) {
    Get.toNamed(AppRouteConfig.cryptoDetailsPagePath,
        arguments: cryptoDataModel);
  }

  // route to go setting page

  void toGoSettingPage() {
    Get.toNamed(AppRouteConfig.settingPagePath);
  }
}
