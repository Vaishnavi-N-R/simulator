import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/text_strings.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';

class LearnDesign extends StatelessWidget {
  final String title;
  final int prizeMoney;

  const LearnDesign({
    Key? key,
    required this.title,
    required this.prizeMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: Get.isDarkMode
              ? TColors.linearGradientdark // Use the defined gradient for dark mode
              : TColors.linearGradientlight,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Text(
            title,
            style: Get.isDarkMode
              ?TTextTheme.darkTextTheme.headlineMedium
              :TTextTheme.lightTextTheme.headlineMedium
          ),
          SizedBox(height: 10),

          // Prize Money Section
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Prize Money',
                style: Get.isDarkMode
              ?TTextTheme.darkTextTheme.bodyLarge
              :TTextTheme.lightTextTheme.bodyLarge
              ),
              SizedBox(width: 10),
              Text(
                '\$${prizeMoney}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:Get.isDarkMode
              ? Colors.green
              : Colors.green[700]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
