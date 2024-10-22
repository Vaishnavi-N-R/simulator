import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/helpers/helper_functions.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    this.option1,
    this.option2,
    this.initialSelectedOption,
    required this.onOptionSelected, // Properly declare the callback
  });

  final String title;
  final String subTitle;
  final String? option1;
  final String? option2;
  final String? initialSelectedOption;
  final Function(String?)
      onOptionSelected; // Callback to return selected option
// To store the selected option

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelectedOption;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDakMode(context);

    return Container(
      decoration: BoxDecoration(
        gradient: Get.isDarkMode
            ? TColors.linearGradientdark
            : TColors.linearGradientlight,
      ),
      padding: const EdgeInsets.all(TSizes.defaultspace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            widget.subTitle,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 250), // Space above buttons

          if (widget.option1 != null) ...[
            SizedBox(
              width: TSizes.buttonWidth(context),
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedOption = widget.option1;
                    widget
                        .onOptionSelected(_selectedOption); // Call the callback
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedOption == widget.option1
                      ? Colors.green
                      : TColors.primary.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  widget.option1!,
                  style: TextStyle(
                    color: dark ? TColors.light : TColors.dark,
                    fontSize: TSizes.fontSizeSm,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],

          if (widget.option2 != null) ...[
            SizedBox(
              width: TSizes.buttonWidth(context),
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedOption = widget.option2;
                    widget
                        .onOptionSelected(_selectedOption); // Call the callback
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedOption == widget.option2
                      ? Colors.green
                      : TColors.primary.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  widget.option2!,
                  style: TextStyle(
                    color: dark ? TColors.light : TColors.dark,
                    fontSize: TSizes.fontSizeSm,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.defaultspace),
          ],
        ],
      ),
    );
  }
}
