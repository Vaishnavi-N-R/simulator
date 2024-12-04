import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trade_simulator/constants/data.dart';
import 'package:trade_simulator/controllers/user_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  var isOtpSent = false.obs;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  var fullPhoneNumber = ''.obs;

  final _storage = FlutterSecureStorage();  // Secure storage instance

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check if user is already logged in
  }

  Future<void> requestVerification(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('${Data.BASE_URL}/auth/request-verification'),
      body: jsonEncode({"phoneNumber": phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      isOtpSent.value = true;
      Get.snackbar('Success', 'Verification code sent.');
    } else {
      Get.snackbar('Error', 'Failed to send verification code.');
    }
  }

  Future<void> verifyCode(String phoneNumber, String code) async {
    final response = await http.post(
      Uri.parse('${Data.BASE_URL}/auth/verify-code'),
      body: jsonEncode({"phoneNumber": phoneNumber, "code": code}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final UserController userController = Get.find<UserController>();

      userController.setUser(responseData['user']);
      userController.setToken(responseData['token']);

      // Store user data and token securely
      await _storage.write(key: 'user', value: jsonEncode(responseData['user']));
      await _storage.write(key: 'token', value: responseData['token']);

      isLoggedIn.value = true;
      isOtpSent.value = false;
      Get.snackbar('Success', 'Logged in successfully!');
    } else {
      Get.snackbar('Error', 'Invalid OTP, please try again.');
    }
  }

  Future<void> checkLoginStatus() async {
    final token = await _storage.read(key: 'token');
    if (token != null) {
      final userData = await _storage.read(key: 'user');
      final UserController userController = Get.find<UserController>();
      userController.setToken(token);
      if (userData != null) {
        userController.setUser(jsonDecode(userData));
        isLoggedIn.value = true;
      }
    }
  }

  Future<void> logout() async {
    await _storage.deleteAll();  // Clear storage
    isLoggedIn.value = false;
    Get.find<UserController>().clearUser();
  }
}
