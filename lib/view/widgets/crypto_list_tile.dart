import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker/model/crypto_data_model.dart';
import 'package:crypto_tracker/view/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CryptoListTile extends StatelessWidget {
  final CryptoDataModel cryptoDataModel;
  final VoidCallback onTap;
  const CryptoListTile(
      {Key? key, required this.onTap, required this.cryptoDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: cryptoDataModel.id,
        child: CachedNetworkImage(
          imageUrl: cryptoDataModel.image,
          width: 40.w,
          height: 40.h,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              ShimmerWidget(width: 40.w, height: 40.h),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(cryptoDataModel.name),
      subtitle: Text(
        cryptoDataModel.symbol.toUpperCase(),
        style: Get.textTheme.bodySmall,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cryptoDataModel.currentPrice.toString(),
            style: Get.textTheme.bodyMedium,
          ),
          Text(
            '${double.parse(cryptoDataModel.priceChangePercentage24H.toStringAsFixed(3))} %',
            style: Get.textTheme.bodySmall!.copyWith(
              fontSize: 12.sp,
              color: (cryptoDataModel.priceChangePercentage24H < 0)
                  ? Colors.red
                  : Colors.green,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
