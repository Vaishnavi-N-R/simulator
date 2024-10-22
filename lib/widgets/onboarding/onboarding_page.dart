import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/constants/text_strings.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      // required this.image,
      required this.title,
      required this.subTitle,
      required this.option1,
      required this.option2});

  final String title, subTitle, option1, option2;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakMode(context);

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.left),
            const SizedBox(height: 250), // Space above buttons

            // Option 1 Button
            SizedBox(
              width: TSizes.buttonWidth(context),
              height: TSizes.buttonHeight, // Set a fixed width for the button
              // Set a fixed width for the button
              child: ElevatedButton(
                onPressed: () {
                  // Handle option 1 action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  option1,
                  style: TextStyle(
                      color: dark ? TColors.light : TColors.dark,
                      fontSize: TSizes.fontSizeSm),
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between buttons

            // Option 2 Button
            SizedBox(
              width: TSizes.buttonWidth(context),
              height: TSizes.buttonHeight, // Set a fixed width for the button
              child: ElevatedButton(
                onPressed: () {
                  // Handle option 2 action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  option2,
                  style: TextStyle(
                      color: dark ? TColors.light : TColors.dark,
                      fontSize: TSizes.fontSizeSm),
                ),
              ),
            ),
            const SizedBox(height: TSizes.defaultspace),
          ],
        ));
  }
}
