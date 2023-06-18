import 'package:crypto_tracker/controller/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Data fetching duration'),
            SizedBox(height: 8.h,),
            Obx(
              ()=> Slider(
                min: 1,
                value: controller.apiDuration.toDouble(),
                max: 15,
                divisions: 15,
                label: controller.apiDuration.toString(),

                onChanged: (value) {
                  controller.putApiDuration(value.toInt());
              },),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Save')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
