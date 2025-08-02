import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_shimmer_widget.dart';

Widget appImageNetwork({
  required double height,
  double width = double.infinity,
  required String url,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: fit ?? BoxFit.fill,
    progressIndicatorBuilder:
        (context, url, progress) =>
            appShimmerWidger(height: height, width: width, radius: 8.r),
    errorWidget:
        (context, url, error) => Image.asset(
          AppAssets.icNoImage,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
  );
}
