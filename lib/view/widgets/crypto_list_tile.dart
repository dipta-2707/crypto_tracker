import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({Key? key}) : super(key: key);

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
      subtitle: Text('Crypto Symbol'),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Crypto Price'),
          Text('Crypto Change %'),
        ],
      ),
      onTap: () {},
    );
  }
}
