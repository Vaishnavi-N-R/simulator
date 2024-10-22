import 'package:flutter/material.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/image_strings.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/constants/text_strings.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_dot_navigation.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_page.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              OnBoardingPage(
                // image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                // image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                // image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          OnBoardingDotNavigation(),
          OnBoardingNextButton()
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakMode(context);
    return Positioned(
        right: TSizes.defaultspace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor:dark? TColors.primary: Colors.black),
            child: const Icon(Icons.arrow_right)));
  }
}
