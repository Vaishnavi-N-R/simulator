import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
    required this.pageController, // Accept PageController
  });

  final PageController pageController; // Store the PageController

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultspace,
      child: SmoothPageIndicator(
        controller: pageController, // Use the passed PageController
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
          dotWidth: 10, // You can adjust dot width as needed
          spacing: 8, // Space between dots
        ),
        count: 4, // Adjust based on the number of onboarding pages
      ),
    );
  }
}
