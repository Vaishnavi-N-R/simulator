import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
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
          gradient: LinearGradient(
            colors: Get.isDarkMode
                ? [
                    const Color.fromARGB(255, 75, 71, 71), // Start color for dark mode
                    const Color.fromARGB(255, 240, 196, 63), // End color for dark mode
                  ]
                : [
                    Colors.white, // Start color for light mode
                    const Color.fromARGB(
                        255, 240, 239, 237), // Light gradient color
                    Colors.amber, // End color for light mode
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
