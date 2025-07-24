import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';

Widget appShimmerWidger({
  required double height,
  required double width,
  required double radius,
}) {
  return FadeShimmer(
    height: height,
    width: width,
    radius: radius,
    millisecondsDelay: 0,
    fadeTheme: FadeTheme.light,
  );
}
