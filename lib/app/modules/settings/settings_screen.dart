import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_svg_iconbutton.dart';

import '../../../shared/localization/localization_const.dart';
import '../../../shared/widgets/app_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: appAppbar(
        centerTitle: true,

        title: getTranslation(context, 'settings.title'),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            settingsListTile(
              title: getTranslation(context, "settings.email"),
              subtitle: "m.yasir.k.2001@gmail.com",
            ),
            settingsListTile(
              title: getTranslation(context, "settings.full_name"),
              subtitle: "Muhammad Yasir",
            ),

            SizedBox(height: 16.h),
            settingsListTile(
              title: getTranslation(context, "settings.notification"),
            ),
            settingsListTile(
              title: getTranslation(context, "settings.share_app"),
            ),
            SizedBox(height: 16.h),
            settingsListTile(
              title: getTranslation(context, "settings.rate_us"),
            ),
            settingsListTile(
              title: getTranslation(context, "settings.privacy_policy"),
            ),
            settingsListTile(
              title: getTranslation(context, "settings.terms_of_use"),
            ),
            SizedBox(height: 16.h),
            settingsListTile(
              title: getTranslation(context, "settings.change_password"),
            ),

            SizedBox(height: 16.h),
            settingsLogoutWidget(
              title: getTranslation(context, "settings.logout"),
              subtitle: "m.yasir.k.2001@gmail.com",
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsLogoutWidget({
    required String title,
    void Function()? onTap,
    required String subtitle,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColor.neutralColor09.withValues(alpha: 0.99),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.08),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.12),
              blurRadius: 1,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.12),
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyle.blackBold14Manrope),
                  Text(
                    "m.yasir.k.2001@gmail.com",
                    style: AppStyle.primary4RegularManrope,
                  ),
                ],
              ),
            ),

            SvgPicture.asset(
              AppAssets.icLeftArrow,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsListTile({
    required String title,
    void Function()? onTap,
    String? subtitle,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColor.neutralColor09.withValues(alpha: 0.99),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.08),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.12),
              blurRadius: 1,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.12),
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(title, style: AppStyle.blackBold14Manrope)),
            subtitle != null
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    "m.yasir.k.2001@gmail.com",
                    style: AppStyle.primary4RegularManrope,
                  ),
                )
                : SizedBox.shrink(),

            SvgPicture.asset(
              AppAssets.icLeftArrow,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
