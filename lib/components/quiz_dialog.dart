import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/models/learn_response.dart';
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

  void checkAnswer() {
    // Find the correct option for the current question
    final correctAnswer = widget.quizzes[currentQuestionIndex].options
        .firstWhere((option) => option.optionValue == 0);

    if (selectedOption == correctAnswer.optionValue) {
      // If the answer is correct, go to the next question if available
      if (currentQuestionIndex < widget.quizzes.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedOption = null; // Reset selected option for the new question
        });
      } else {
        // If it's the last question, close the dialog
        Get.back();
      }
    } else {
      // Show feedback if the answer is incorrect
      Get.snackbar(
        "Incorrect",
        "Please select the correct answer to proceed.",
        backgroundColor: Get.isDarkMode
            ? TSnackbarTheme.darkSnackBarTheme.backgroundColor
            : TSnackbarTheme.lightSnackBarTheme.backgroundColor,
        colorText: Get.isDarkMode
            ? TSnackbarTheme.darkSnackBarTheme.contentTextStyle?.color
            : TSnackbarTheme.lightSnackBarTheme.contentTextStyle?.color,
        snackPosition: SnackPosition.BOTTOM, // or dark version based on theme
      );
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
              child: Padding(padding:EdgeInsets.symmetric(horizontal: 20),child:Text('Submit')),
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
