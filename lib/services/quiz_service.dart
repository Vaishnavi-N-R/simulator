import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trade_simulator/constants/data.dart';

class QuizService {
  static Future<Map<String, dynamic>> submitQuizAnswer({
    required String userId,
    required String courseId,
    required String questionId,
    required int submittedOption,
    required String token,
  }) async {
    final url = Uri.parse('${Data.BASE_URL}/learning-course/submit-quiz-answer');

    // Debug print statements for request data
    print("Submitting quiz answer with the following details:");
    print("User ID: $userId");
    print("Course ID: $courseId");
    print("Question ID: $questionId");
    print("Submitted Option: $submittedOption");
    print("Token: $token");
    
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          "userId": userId,
          "courseId": courseId,
          "questionId": questionId,
          "submittedOption": submittedOption, // Use dynamic value instead of hardcoded '0'
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print("Quiz response: ${response.body}");
        return jsonDecode(response.body); // Return parsed JSON response
      } else {
        print("Quiz response error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to submit answer');
      }
    } catch (e) {
      print("Error in submitQuizAnswer: $e");
      throw Exception('Failed to submit answer');
    }
  }
}
