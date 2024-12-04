import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trade_simulator/components/learn.dart';
import 'package:trade_simulator/components/learn_detail_screen.dart';
import 'package:trade_simulator/components/quiz_dialog.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';
import 'package:trade_simulator/controllers/login_controller.dart';
import 'package:trade_simulator/theme/custom_themes/elevated_button_theme.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';
import 'package:trade_simulator/widgets/login/login_bottom_sheet.dart';

class LearnDetails extends StatelessWidget {
  final String lessonId;
  const LearnDetails({Key? key, required this.lessonId})
      : super(key: key); // Constructor
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    final LearnController learnController = Get.put(LearnController());

    return Scaffold(
      body: Obx(() {
        if (learnController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        var lesson = learnController.learningCourses.firstWhere(
          (lesson) => lesson.id == lessonId,
        );
        if (lesson == null) {
          return Center(child: Text("No lesson found with the given ID."));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              LearnDetailScreen(
                title: lesson.title,
                content: lesson.content,
                id: lesson.id,
              ),

              SizedBox(height: 20), // Add some spacing
              // Button to navigate to the Quiz
              ElevatedButton(
                onPressed: () {
                  if (loginController.isLoggedIn.value) {
                    // Show Quiz Dialog if the user is logged in
                    showDialog(
                      context: context,
                      builder: (context) => QuizDialog(quizzes: lesson.quiz),
                    );
                  } else {
                    // Show Bottom Sheet to login if the user is not logged in
                    Get.bottomSheet(LoginBottomSheet());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Take Quiz and get ${lesson.prizeMoney} Rs.',
                    style: Get.isDarkMode
                        ? TTextTheme
                            .darkTextTheme.titleLarge // Use dark text theme
                        : TTextTheme.lightTextTheme.titleLarge,
                  ),
                ),
                style: Get.isDarkMode
                    ? TElevatedButtonTheme
                        .darkElevatedButtonTheme // Use dark theme
                    : TElevatedButtonTheme.lightElevatedButtonTheme,
              ),
            ],
          )),
        );
      }),
    );
  }
}
