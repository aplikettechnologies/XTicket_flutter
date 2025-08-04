import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xticket/app/modules/nearMe/nearme_controller.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';

import '../../../shared/utils/app_round_fab.dart';

class NearmeScreen extends StatelessWidget {
  const NearmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NearmeController>(
      init: NearmeController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: controller.mapType.value,
                initialCameraPosition: CameraPosition(
                  target: controller.center.value,
                  zoom: 12.0,
                ),
                markers: controller.markers.toSet(),
                zoomControlsEnabled: false,
                onMapCreated: controller.onMapCreated,
                zoomGesturesEnabled: false,
                compassEnabled: false,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 40.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      appRoundFAB(
                        onPressed: () async => controller.toggleMapType(),
                        iconAsset: AppAssets.icMap,
                        backgroundColor: AppColor.primaryColor04,
                      ),
                      SizedBox(height: 12.h),
                      appRoundFAB(
                        onPressed: () async => controller.getCurrentLocation(),
                        iconAsset: AppAssets.icTarget,
                        backgroundColor: AppColor.primaryColor04,
                      ),
                      SizedBox(height: 12.h),
                      appRoundFAB(
                        onPressed: () {
                          // Your action
                        },
                        iconAsset: AppAssets.icRefresh,
                        backgroundColor: AppColor.primaryColor04,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
