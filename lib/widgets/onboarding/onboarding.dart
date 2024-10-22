import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/image_strings.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/constants/text_strings.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';
import 'package:trade_simulator/screens/home_page.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_dot_navigation.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_page.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              OnBoardingPage(
                // image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1, option1: TTexts.a1,
                option2: TTexts.b1,
              ),
              OnBoardingPage(
                // image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2, option1: TTexts.a2,
                option2: TTexts.b2,
              ),
              OnBoardingPage(
                // image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3, option1: TTexts.a3,
                option2: TTexts.b3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          OnBoardingDotNavigation(pageController: _pageController),
          OnBoardingNextButton(pageController: _pageController)
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  final PageController pageController; // Store the PageController

  const OnBoardingNextButton({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakMode(context);
    return Positioned(
        right: TSizes.defaultspace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () {
              if (pageController.page?.round() == 2) {
                // Optionally handle last page scenario (e.g., navigate to another screen)
                // Navigator.of(context).pushReplacement(/* Navigate to next screen */);
                Get.off(() => HomePage()); // Use GetX for navigation

                print(
                    "Onboarding completed"); // Replace with your navigation code
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? TColors.primary : Colors.black),
            child: const Icon(Icons.arrow_right)));
  }
}
