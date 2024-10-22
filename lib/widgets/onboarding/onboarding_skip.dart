import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX for navigation
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';
import 'package:trade_simulator/screens/home_page.dart'; // Make sure to import your HomePage

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
        final dark = THelperFunctions.isDakMode(context);

    return Positioned(
      top: TDeviceUtils.getAppBarHeight() +
          TSizes.defaultspace, // Adjust position below the app bar
      right: TSizes.defaultspace,
      child: TextButton(
        onPressed: () {
          // Navigate to the HomePage when "Skip" is pressed
          Get.off(() => HomePage()); // Use GetX for navigation
        },
        style: TextButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Optional: Set background color if needed
          padding: EdgeInsets.symmetric(
            vertical: TSizes.defaultspace / 2,
            horizontal: TSizes.defaultspace,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            color:  dark? TColors.light: TColors.dark, // Use your theme's primary color
            fontSize: 16, // Adjust font size as necessary
            fontWeight: FontWeight.bold, // Make it bold for emphasis
          ),
        ),
      ),
    );
  }
}
