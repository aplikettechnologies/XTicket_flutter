import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_signin_model.dart';

enum AuthResult { success, canceled, failure }

class AuthApiServices extends GetxService {
  // 🔑 Login Request
  Future<void> loginRequest() async {}

  // 📝 Registration Request
  Future<void> registrationRequest() async {}

  // 🔒 Forget Password Request
  Future<void> forgetPasswordRequest() async {}

  // 🌐 Continue with Google
  Future<GoogleSignInModel> continueWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled at Google account picker
        Get.log("❌ Google Sign-In canceled by user");
        return GoogleSignInModel(
          success: false,
          message: "Sign-in canceled by user",
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      Get.log("✅ Google Sign-In successful: ${userCredential.user?.email}");

      return GoogleSignInModel(success: true, user: userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'sign_in_canceled') {
        Get.log("❌ Sign-in canceled by FirebaseAuth");
        return GoogleSignInModel(
          success: false,
          message: "Sign-in canceled by user",
        );
      }

      Get.log("❌ FirebaseAuthException: ${e.message}");
      return GoogleSignInModel(success: false, message: e.message);
    } catch (e) {
      Get.log("❌ Google Sign-In Error: $e");
      return GoogleSignInModel(success: false, message: e.toString());
    }
  }

  // 📘 Continue with Facebook
  Future<void> continueWithFacebook() async {
    try {} catch (e) {
      Get.log("❌ Facebook Sign-In Error: $e");
      rethrow;
    }
  }
}
