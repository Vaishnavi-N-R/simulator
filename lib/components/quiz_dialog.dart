import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';
import 'package:trade_simulator/controllers/user_controller.dart';
import 'package:trade_simulator/models/learn_response.dart';
import 'package:trade_simulator/services/quiz_service.dart';
import 'package:trade_simulator/theme/custom_themes/elevated_button_theme.dart';
import 'package:trade_simulator/theme/custom_themes/snackbar_theme.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';

class QuizDialog extends StatefulWidget {
  final List<Quiz> quizzes;

  const QuizDialog({Key? key, required this.quizzes}) : super(key: key);

  @override
  _QuizDialogState createState() => _QuizDialogState();
}

class _QuizDialogState extends State<QuizDialog> {
  int currentQuestionIndex = 0;
  int? selectedOption;
  final UserController userController = Get.find<UserController>();
  final LearnController learnController = Get.find<LearnController>();

  void checkAnswer() async {
    try {
      // Call the service
      final token =
          userController.authToken; // Access token from the controller

      final response = await QuizService.submitQuizAnswer(
        userId: userController.user.value!.id, // Replace with dynamic user ID
        courseId: learnController
            .selectedCourseId.value, // Replace with dynamic course ID
        questionId:
            widget.quizzes[currentQuestionIndex].id, // Dynamic question ID
        submittedOption: selectedOption!, token: token,
      );

      if (response['isCorrect']) {
        Get.snackbar('Correct!', 'You answered correctly!',
            backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);

        // Move to the next question if correct
        if (currentQuestionIndex < widget.quizzes.length - 1) {
          setState(() {
            currentQuestionIndex++;
            selectedOption = null; // Reset
          });
        } else if (response['isCompleted']) {
          // Quiz completed
          Get.back();
          Get.snackbar('Completed!',
              'Quiz completed! You won ${response['prizeMoney']}!',
              backgroundColor: Colors.blue);
        }
      } else {
        Get.snackbar('Try Again!', 'Incorrect answer, please try again.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar('Error', 'Failed to submit answer.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quizzes[currentQuestionIndex];

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${widget.quizzes.length}',
              style: Get.isDarkMode
                  ? TTextTheme.darkTextTheme.titleSmall
                  : TTextTheme.lightTextTheme.titleSmall,
            ),
            SizedBox(height: 10),
            Text(
              quiz.questionText,
              style: Get.isDarkMode
                  ? TTextTheme.darkTextTheme.headlineSmall
                  : TTextTheme.lightTextTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Column(
              children: quiz.options.map((option) {
                return RadioListTile<int>(
                  title: Text(option.optionLabel),
                  value: option.optionValue,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: selectedOption == null ? null : checkAnswer,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Submit')),
              style: Get.isDarkMode
                  ? TElevatedButtonTheme
                      .darkElevatedButtonTheme // Use dark theme
                  : TElevatedButtonTheme.lightElevatedButtonTheme,
            ),
          ],
        ),
      ),
    );
  }
}
