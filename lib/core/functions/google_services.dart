import 'dart:convert';
import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

    final googleAuth = googleUser.authentication;
    final idToken = googleAuth.idToken;

    // إرسال التوكين للسيرفر (Laravel)
    final response = await http.post(
      Uri.parse("https://your-backend.com/api/auth/google"),
      headers: {"Accept": "application/json"},
      body: {"token": idToken},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      log("✅ تسجيل دخول: ${data['data']['name']} (${data['data']['email']})");
      log("🔑 توكين Sanctum: ${data['data']['token']}");
    } else {
      log("❌ خطأ: ${response.body}");
    }
  } catch (e) {
    log("⚠️ صار خطأ: $e");
  }
}
