import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CryptoListTile extends StatelessWidget {
  final Function() onTap;
  const CryptoListTile({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        width: 40.w,
        height: 40.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text('Crypto Name'),
      subtitle: Text(
        'Crypto Symbol',
        style: Get.textTheme.bodySmall,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Crypto Price',
            style: Get.textTheme.bodyMedium,
          ),
          Text(
            'Crypto Change %',
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
