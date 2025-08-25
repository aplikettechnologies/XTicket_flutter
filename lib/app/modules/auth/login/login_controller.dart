import 'package:get/get.dart';
import 'package:xticket/shared/widgets/app_overlay_loader.dart';
import '../auth_services/auth_api_services.dart';

class LoginController extends GetxController {
  AuthApiServices authService = Get.put(AuthApiServices());

  /// Continue with Google
  Future<void> continueWithGoogle() async {
    AppOverlay.showLoader(
      message: "Authenticate with google",
      asyncFunc: () async {
        try {
          final res = await authService.continueWithGoogle();
          if (res.success) {}
          Get.log("✅ User signed in with Google successfully");
        } catch (e) {
          Get.log("❌ Error in LoginController (Google Sign-In): $e");
          // Optionally show error overlay or toast here
        }
      },
    );
  }

  /// Continue with Facebook
  Future<void> continueWithFacebook() async {
    try {
      await authService.continueWithFacebook();
    } catch (e) {
      Get.log("❌ Error in LoginController (Facebook Sign-In): $e");
    }
  }

  /// Login with Email/Password
  Future<void> loginWithEmailPassword(String email, String password) async {
    try {
      await authService.loginRequest(); // Implement loginRequest in service
    } catch (e) {
      Get.log("❌ Error in LoginController (Email/Password): $e");
    }
  }
}
