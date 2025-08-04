import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  late GoogleMapController mapController;

  final Rx<LatLng> center = LatLng(21.1702, 72.8311).obs;
  final RxSet<Marker> markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Location Disabled", "Please enable location services.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location permission is required.");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    center.value = LatLng(position.latitude, position.longitude);

    mapController.animateCamera(CameraUpdate.newLatLngZoom(center.value, 14));

    update();
  }
}
