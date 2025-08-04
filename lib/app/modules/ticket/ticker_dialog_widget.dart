import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_svg_iconbutton.dart';

import '../../../routes/app_routes.dart';

class TicketPopupCard extends StatelessWidget {
  const TicketPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomPaint(
        painter: TicketPainter(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: svgIconButton(
                  iconPath: AppAssets.icClose,
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.zero,
                  size: 25.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap:
                    () =>
                        Get
                          ..back()
                          ..toNamed(AppRoutes.map),
                child: SvgPicture.asset(
                  AppAssets.icDummyQrCode,
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 13.h),
              Text("233556TU46NJ", style: AppStyle.blackMedium18Manrope),
              const SizedBox(height: 20),

              // Custom dotted line with cuts
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: DottedLine(
                  dashColor: AppColor.grey2,
                  lineThickness: 1.h,
                  dashLength: 5.w,
                ),
              ),
              SizedBox(height: 20.h),
              Text("Summer Splash", style: AppStyle.neutral2SemiBold14Manrope),
              SizedBox(height: 5.h),
              Text(
                "Al Safa Park, Jeddah, Saudi Arabia",
                style: AppStyle.neutral3Medium14Manrope,
              ),
              SizedBox(height: 5.h),
              Text(
                "Mar 19 2024 - Mar 21 2024",
                style: AppStyle.neutral3Medium14Manrope,
              ),
              SizedBox(height: 5.h),
              Text(
                "8:30 PM - 11:30 PM ",
                style: AppStyle.neutral3Medium14Manrope,
              ),
              SizedBox(height: 5.h),
              Text(
                "Type: 20 Mar 10:30 -11:30 PM ",
                style: AppStyle.neutral3Medium14Manrope,
              ),
              SizedBox(height: 5.h),
              Text(
                "Price: 300.00 SAR",
                style: AppStyle.neutral2SemiBold14Manrope,
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final shadowPaint =
        Paint()
          ..color = AppColor.black.withValues(alpha: 0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);

    final path = Path();
    final shadowPath = Path();

    const radius = 16.0;
    const cutRadius = 15.0;

    // Calculate the position for the cuts (around the dotted line area)
    // Assuming the dotted line is roughly in the middle-upper area based on your layout
    final cutY =
        size.height * 0.64; // Adjust this based on your dotted line position

    // Create the ticket shape with cuts
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );

    // Right side with cut
    path.lineTo(size.width, cutY - cutRadius);
    path.arcToPoint(
      Offset(size.width, cutY + cutRadius),
      radius: const Radius.circular(cutRadius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );

    // Left side with cut
    path.lineTo(0, cutY + cutRadius);
    path.arcToPoint(
      Offset(0, cutY - cutRadius),
      radius: const Radius.circular(cutRadius),
      clockwise: false,
    );

    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: const Radius.circular(radius));
    path.close();

    // Create shadow path (slightly offset)
    shadowPath.addPath(path, const Offset(0, 2));

    // Draw shadow
    canvas.drawPath(shadowPath, shadowPaint);

    // Draw the ticket
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
