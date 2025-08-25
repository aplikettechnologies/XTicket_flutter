import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInModel {
  final bool success;
  final String? message;
  final User? user;

  GoogleSignInModel({required this.success, this.message, this.user});
}
