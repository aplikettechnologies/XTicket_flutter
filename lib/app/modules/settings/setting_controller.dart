import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingController extends GetxController {
  String version = '';
  bool isLoading = false;

  Future<void> getProfileData() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  Future<void> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    version = info.version;
    update();
  }

  @override
  Future<void> onInit() async {
    await getProfileData();
    getAppVersion();  
    super.onInit();
  }
}
