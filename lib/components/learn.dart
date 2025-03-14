import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/components/learn_detail_screen.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/constants/text_strings.dart';
import 'package:trade_simulator/screens/learn_details.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';
import 'package:trade_simulator/widgets/learn/learn_design.dart';

class LearnDesign extends StatelessWidget {
  final String title;
  final int prizeMoney;
  final String id;
  final String status; // Added status field

  const LearnDesign({
    Key? key,
    required this.title,
    required this.prizeMoney,
      required this.id,

    required this.status, // Add status to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LearnDetails(lessonId: id)),
              )
            },
        child: CardDesignContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Get.isDarkMode
                      ? TTextTheme.darkTextTheme.headlineMedium
                      : TTextTheme.lightTextTheme.headlineMedium),
              SizedBox(height: 10),

              // Prize Money Section
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Prize Money',
                      style: Get.isDarkMode
                          ? TTextTheme.darkTextTheme.bodyLarge
                          : TTextTheme.lightTextTheme.bodyLarge),
                  SizedBox(width: 10),
                  Text(
                    '\$${prizeMoney}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            Get.isDarkMode ? Colors.green : Colors.green[700]),
                  ),
                  SizedBox(width: 10),

                  // Status Section
                  Text(
                    'Status: $status', // Display the status
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: status == 'uncompleted'
                          ? Colors.red
                          : Colors.green, // Highlight 'uncompleted' in red
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
