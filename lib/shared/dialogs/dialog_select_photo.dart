import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/widgets/app_divider.dart';

import '../utils/app_assets.dart';
import '../utils/app_color.dart';

Widget dialogSelectPhoto({
  required BuildContext context,
  required final Function() cameraTap,
  required final Function() gallaryTap,
}) {
  return Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
    backgroundColor: AppColor.white,

    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColor.neutralColor10,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: cameraTap,
            child: Padding(
              padding: EdgeInsets.only(bottom: 17.h, top: 34.h, left: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAssets.icCamera,
                    height: 25.h,
                    width: 25.w,
                    colorFilter: ColorFilter.mode(
                      AppColor.dark,
                      BlendMode.srcIn,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      getTranslation(context, 'dialog_select_photo.take_photo'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appDivider(),
          InkWell(
            onTap: gallaryTap,
            child: Padding(
              padding: EdgeInsets.only(top: 17.h, bottom: 34.h, left: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAssets.icGallary,
                    height: 17.h,
                    width: 17.w,
                    colorFilter: ColorFilter.mode(
                      AppColor.dark,
                      BlendMode.srcIn,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      getTranslation(
                        context,
                        'dialog_select_photo.choose_from_library',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
