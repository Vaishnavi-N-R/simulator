import 'package:get/get.dart';
import 'package:trade_simulator/models/learn_response.dart';

class QuizController extends GetxController {
  final List<Quiz> quizQuestions;
  int currentQuestionIndex = 0;

  QuizController({required this.quizQuestions});

  Quiz get currentQuestion => quizQuestions[currentQuestionIndex];

  void nextQuestion() {
    if (currentQuestionIndex < quizQuestions.length - 1) {
      currentQuestionIndex++;
      update(); // Update the UI
    } else {
      // Handle quiz completion
    }
  }
}
