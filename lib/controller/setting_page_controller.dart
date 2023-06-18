import 'package:get/get.dart';

class SettingPageController extends GetxController{
  RxInt _apiDuration = 5.obs;
  int get apiDuration => _apiDuration.value;

  void putApiDuration (int value)=> _apiDuration.value = value;
}