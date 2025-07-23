import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xticket/shared/utils/app_assets.dart';

import '../utils/app_color.dart';

Widget appImageNetwork({
  required double height,
  double loadingSize = 50,
  double width = double.infinity,
  required String url,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: BoxFit.fill,
    progressIndicatorBuilder:
        (context, url, progress) => Container(
          height: height,
          width: width,

          alignment: Alignment.center,
          child: LoadingAnimationWidget.fourRotatingDots(
            size: loadingSize,
            color: AppColor.primaryColor04,
          ),
        ),

    errorWidget:
        (context, url, error) => Image.asset(
          AppAssets.icNoImage,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
  );
}
