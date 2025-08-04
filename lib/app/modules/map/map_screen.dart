import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xticket/app/modules/map/map_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';

import '../../../shared/utils/app_style.dart';
import '../../../shared/widgets/app_search_field.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      init: MapController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appAppbar(
            title: getTranslation(context, "Map"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: appSearchField(
                  context: context,
                  hintTextStyle: AppStyle.searchHintTextStyle.copyWith(
                    fontSize: 13.sp,
                  ),
                  hintText: getTranslation(context, 'event.search_events'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
