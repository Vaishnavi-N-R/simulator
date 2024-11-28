import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trade_simulator/constants/data.dart';

class QuizService {
  static Future<Map<String, dynamic>> submitQuizAnswer({
    required String userId,
    required String courseId,
    required String questionId,
    required int submittedOption,
    required String token, // Add token parameter

  }) async {
    final url = Uri.parse(
        '${Data.BASE_URL}/learning-course/submit-quiz-answer');

    final response = await http.post(
      url,
      body: jsonEncode({
        "userId": userId,
        "courseId": courseId,
        "questionId": questionId,
        "submittedOption": 0,
      }) ,
      //   body: jsonEncode({
      //   "userId":'671b27fbd4425186b2be9025',
      //   "courseId": "67483cf97e1eb046fcd684e2",
      //   "questionId": "67483cf97e1eb046fcd684e3",
      //   "submittedOption": 0,
      // }),
     headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include the token here
      },
    );

    if (response.statusCode == 200) {
      print("Quiz response: ${response.body}");
      return jsonDecode(response.body); // Return the response body
    } else {
            print("Quiz response: ${response.body}");

      throw Exception('Failed to submit answer'); // Handle errors
    }
  }
}
