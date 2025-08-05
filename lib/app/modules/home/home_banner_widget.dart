import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/home/home_controller.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_indicator.dart';

import '../../../shared/widgets/app_image_network.dart';

Widget homeBannerWidget(HomeController controller) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      //SliderImage
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          viewportFraction: 1.0,
          height: 195.h,
          reverse: false,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 300),
          onPageChanged: (index, reason) {
            controller.currentBannerIndex.value = index;
          },
        ),
        items: List.generate(
          controller.eventBanner.length,
          (index) => appImageNetwork(
            url: controller.eventBanner[index].toString(),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 195.h,
          ),
        ),
      ),

      //Indicator
      Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Obx(
              () => AppIndicator(
                index: index,
                currentPage: controller.currentBannerIndex.value,
                activeColor: AppColor.grey3,
                unActiveColor: AppColor.neutralColor04,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
