import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/login_controller.dart';
import 'package:trade_simulator/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:trade_simulator/widgets/login/country_code_widget.dart';
import 'package:trade_simulator/widgets/login/input_action_widget.dart';
asdadadsasdswd
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
              Container(
                child: Column(
                  children: [
                    CountryCodePhoneInput(
                      controller: loginController.phoneNumberController,
                      onInputChanged: (phoneNumber) {
                        // Update the controller with full phone number here
                        loginController.fullPhoneNumber.value =
                            phoneNumber.dialCode! +
                                loginController.phoneNumberController.text;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get the full phone number with country code
                        final phoneNumber =
                            loginController.fullPhoneNumber.value.isEmpty
                                ? loginController.phoneNumberController.text
                                : loginController.fullPhoneNumber.value;

                        loginController.requestVerification(phoneNumber);
                      },
                      child: Text('Request OTP'),
                    )
                  ],
                ),
              ),
            if (!loginController.isLoggedIn.value &&
                loginController.isOtpSent.value)
              InputActionWidget(
                controller: loginController.otpController,
                labelText: 'Enter OTP',
                buttonText: 'Submit OTP',
                onButtonPressed: () {
                  final phoneNumber = loginController.fullPhoneNumber.value;
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
