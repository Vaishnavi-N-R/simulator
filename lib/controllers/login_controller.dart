// controller/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trade_simulator/constants/data.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  // Function to send verification request
  Future<void> requestVerification(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('${Data.BASE_URL}/auth/request-verification'),
      body: jsonEncode({"phoneNumber": phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Verification code sent.');
    } else {
      Get.snackbar('Error', 'Failed to send verification code.');
    }
  }

  // Function to verify the OTP
  Future<void> verifyCode(String phoneNumber, String code) async {
    final response = await http.post(
      Uri.parse('${Data.BASE_URL}/auth/verify-code'),
      body: jsonEncode({"phoneNumber": phoneNumber, "code": code}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      isLoggedIn.value = true;
      Get.snackbar('Success', 'Logged in successfully!');
    } else {
      Get.snackbar('Error', 'Invalid OTP, please try again.');
    }
  }
}
