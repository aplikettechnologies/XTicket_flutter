import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingController extends GetxController {
  String version = '';

  Future<void> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    version = info.version;
    update();
  }

  @override
  void onInit() {
    getAppVersion();
    super.onInit();
  }
}
