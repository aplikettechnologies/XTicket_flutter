import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/home/filter_city_selector_widget.dart';
import 'package:xticket/app/modules/home/home_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_indicator.dart';
import 'package:xticket/shared/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder:
          (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 300,
                      ),
                      onPageChanged: (index, reason) {
                        controller.currentBannerIndex.value = index;
                      },
                    ),
                    items: List.generate(
                      controller.eventBanner.length,
                      (index) => Image.network(
                        controller.eventBanner[index].toString(),
                        fit: BoxFit.cover,
                        width: double.infinity,
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
              ),

              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12.w,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withValues(alpha: 0.10),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          cursorHeight: 20.h,
                          controller: controller.searchEventController,
                          style: AppStyle.grey2Regular12Lato,
                          decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 40.w,
                              minHeight: 40.h,
                            ),
                            hintText: getTranslation(
                              context,
                              "home.search_events",
                            ),
                            hintStyle: AppStyle.grey2Regular12Lato,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                left: 12.w,
                                right: 8.w,
                              ), // adjust spacing
                              child: SvgPicture.asset(
                                AppAssets.icSearch.removeAllWhitespace,
                                width: 24.w,
                                height: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    filterCitySelector(
                      context: context,
                      controller: controller,
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withValues(alpha: 0.10),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          AppAssets.icFilterSetting.removeAllWhitespace,
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.contain,
                          // ignore: deprecated_member_use
                          color: AppColor.primaryColor04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
