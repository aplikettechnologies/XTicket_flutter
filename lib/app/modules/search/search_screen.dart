import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/search/search_controller.dart';
import 'package:xticket/shared/bottomSheet/search_filter_bottom_sheet.dart';
import 'package:xticket/shared/dialogs/dialog_select_city.dart';
import 'package:xticket/shared/utils/app_helper.dart';
import '../../../shared/localization/localization_const.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_color.dart';
import '../../../shared/utils/app_style.dart';
import '../../../shared/widgets/app_search_field.dart';
import 'widget/item_search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      init: SearchScreenController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Filter
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: appSearchField(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: SvgPicture.asset(
                              AppAssets.icBack,
                              height: 24.h,
                              width: 24.w,
                              colorFilter: ColorFilter.mode(
                                AppColor.grey2,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          context: context,
                          hintText: getTranslation(
                            context,
                            'search.search_events',
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),

                      Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: () {
                            AppHelper().showAppDialog(
                              context: context,
                              dialogWidget: dialogSelectCity(
                                context: context,
                                searchScreenController: controller,
                              ),
                            );
                          },
                          child: Container(
                            height: 48.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 19.w,
                              vertical: 10.h,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColor.white,
                              border: Border.all(
                                color: AppColor.neutralColor08,
                                width: 1.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.black.withValues(alpha: 0.1),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  getTranslation(context, 'search.city'),
                                  style: AppStyle.grey2Regular12Lato.copyWith(
                                    color: AppColor.grey2,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.h),
                                  child: SvgPicture.asset(
                                    AppAssets.icDropdown,
                                    height: 6.h,
                                    width: 10.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            AppHelper().showAppBottomSheet(
                              context: context,
                              bottomSheetWidget: searchFilterBottomSheet(
                                context: context,
                                searchScreenController: controller,
                              ),
                            );
                          },
                          child: Container(
                            height: 48.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 19.w,
                              vertical: 10.h,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColor.white,
                              border: Border.all(
                                color: AppColor.neutralColor08,
                                width: 1.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.black.withValues(alpha: 0.1),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              AppAssets.icFilter,
                              height: 24.h,
                              width: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),

                //List
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 15,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemBuilder: (context, index) {
                      return itemSearchList();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
