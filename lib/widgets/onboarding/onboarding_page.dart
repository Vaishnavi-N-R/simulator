import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    // required this.image,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        // Apply gradient background
        decoration: BoxDecoration(
          gradient: Get.isDarkMode
              ? TColors
                  .linearGradientdark // Use the defined gradient for dark mode
              : TColors.linearGradientlight,
        ),
        padding: const EdgeInsets.all(TSizes.defaultspace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(
            //     width: THelperFunctions.screenWidth() * 0.8,
            //     height: THelperFunctions.screenHeight() * 0.6,
            //     image: AssetImage(image)),

            Text(title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left),
          ],
        ));
  }
}
