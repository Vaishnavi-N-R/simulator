// widget/login_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/login_controller.dart';
import 'package:trade_simulator/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:trade_simulator/widgets/login/input_action_widget.dart';

class LoginBottomSheet extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    final bottomSheetTheme = Get.isDarkMode
        ? TBottomSheetTheme.darkBottomSheetTheme
        : TBottomSheetTheme.lightBottomSheetTheme;

    return Obx(() {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: bottomSheetTheme.backgroundColor,
        ),
        constraints: bottomSheetTheme.constraints,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!loginController.isLoggedIn.value &&
                !loginController.isOtpSent.value)
              InputActionWidget(
                controller: loginController.phoneNumberController,
                labelText: 'Enter Phone Number',
                buttonText: 'Request OTP',
                onButtonPressed: () {
                  final phoneNumber =
                      loginController.phoneNumberController.text;
                  loginController.requestVerification(phoneNumber);
                },
              ),
            if (!loginController.isLoggedIn.value &&
                loginController.isOtpSent.value)
              InputActionWidget(
                controller: loginController.otpController,
                labelText: 'Enter OTP',
                buttonText: 'Submit OTP',
                onButtonPressed: () {
                  final phoneNumber =
                      loginController.phoneNumberController.text;
                  final code = loginController.otpController.text;
                  loginController.verifyCode(phoneNumber, code);
                },
              ),
          ],
        ),
      );
    });
  }
}
