import 'package:flutter/material.dart';

import '../widgets/crypto_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => CryptoListTile(),
      ),
    );
  }
}
