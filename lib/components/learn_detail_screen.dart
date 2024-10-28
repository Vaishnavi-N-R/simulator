import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';
import 'package:trade_simulator/utils/html.dart';
import 'package:trade_simulator/widgets/appbar/appbar.dart';

class LearnDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String id;
  const LearnDetailScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TAppBar(
          title: Text("Lesson Detail"),
        ),
        Text(title,
            style: Get.isDarkMode
                ? TTextTheme.darkTextTheme.headlineMedium
                : TTextTheme.lightTextTheme.headlineMedium),
        SizedBox(height: 10),
        // Prize Money Section
        Text(
          removeHtmlTags(content),
          style: TTextTheme.lightTextTheme.bodySmall,
        ),
      ],
    );
  }
}
