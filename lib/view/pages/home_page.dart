import 'package:crypto_tracker/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/crypto_list_tile.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => CryptoListTile(
          onTap: controller.toGoCryptoDetailsPage,
        ),
      ),
    );
  }
}
