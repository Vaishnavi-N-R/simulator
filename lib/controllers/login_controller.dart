import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trade_simulator/constants/data.dart';
import 'package:trade_simulator/controllers/user_controller.dart';
import 'package:trade_simulator/services/storage_service.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  var isOtpSent = false.obs;
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  var fullPhoneNumber = ''.obs;

  final StorageService _storageService =
      StorageService(); // Use the StorageService

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check if the user is already logged in
  }

  // Function to request OTP verification code
  Future<void> requestVerification(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('${Data.BASE_URL}/auth/request-verification'),
        body: jsonEncode({"phoneNumber": phoneNumber}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        isOtpSent.value = true;
        Get.snackbar('Success', 'Verification code sent.');
      } else {
        final responseData = jsonDecode(response.body);
        Get.snackbar('Error',
            responseData['message'] ?? 'Failed to send verification code.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // Function to verify OTP code
  Future<void> verifyCode(String phoneNumber, String code) async {
    try {
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

        // Store user data and token securely using StorageService
        await _storageService.saveUserData(
            responseData['user'], responseData['token']);

        isLoggedIn.value = true;
        isOtpSent.value = false;
        Get.snackbar('Success', 'Logged in successfully!');
      } else {
        final responseData = jsonDecode(response.body);
        Get.snackbar('Error',
            responseData['message'] ?? 'Invalid OTP, please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // Function to check if the user is already logged in
  Future<void> checkLoginStatus() async {
    print("object");
    try {
      final token = await _storageService.getToken();
      print("TOken is $token");
      if (token != null) {
        final userData = await _storageService.getUserData();
        final UserController userController = Get.find<UserController>();

        userController.setToken(token);
        if (userData != null) {
          userController.setUser(userData);
          isLoggedIn.value = true;
          print('User is logged in with token: $token');
        }
      }
    } catch (e) {
      print('Error checking login status: $e');
    }
  }

  // Function to log out the user
  Future<void> logout() async {
    try {
      await _storageService
          .clearUserData(); // Clear storage using StorageService
      isLoggedIn.value = false;
      Get.find<UserController>().clearUser();
      Get.snackbar('Success', 'Logged out successfully.');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while logging out: $e');
    }
  }
}
