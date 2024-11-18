// controller/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trade_simulator/constants/data.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  var isOtpSent = false.obs;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  // Add a variable to store the full phone number (with country code)
  var fullPhoneNumber = ''.obs;

  Future<void> requestVerification(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('${Data.BASE_URL}/auth/request-verification'),
      body: jsonEncode({"phoneNumber": phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      isOtpSent.value = true; // Set OTP status to true
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
      isLoggedIn.value = true;
      isOtpSent.value = false; // Reset OTP status
      Get.snackbar('Success', 'Logged in successfully!');
    } else {
      Get.snackbar('Error', 'Invalid OTP, please try again.');
    }
  }
}
