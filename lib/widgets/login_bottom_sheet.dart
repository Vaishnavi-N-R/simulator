// widget/login_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/login_controller.dart';

class LoginBottomSheet extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!loginController.isLoggedIn.value)
              Column(
                children: [
                  TextField(
                    controller: loginController.phoneNumberController,
                    decoration: InputDecoration(labelText: 'Enter Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final phoneNumber = loginController.phoneNumberController.text;
                      loginController.requestVerification(phoneNumber);
                    },
                    child: Text('Request OTP'),
                  ),
                ],
              ),
            if (!loginController.isLoggedIn.value)
              Column(
                children: [
                  TextField(
                    controller: loginController.otpController,
                    decoration: InputDecoration(labelText: 'Enter OTP'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final phoneNumber = loginController.phoneNumberController.text;
                      final code = loginController.otpController.text;
                      loginController.verifyCode(phoneNumber, code);
                    },
                    child: Text('Submit OTP'),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}
