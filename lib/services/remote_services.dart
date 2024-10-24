import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trade_simulator/constants/data.dart';
import 'package:trade_simulator/models/learn_response.dart';

class RemoteServices {
  static var client = http.Client();

  // Fetch learning courses from the API
  static Future<List<LearningCourse>?> fetchLessons(String category) async {
    var url =
        '${Data.BASE_URL}/learning-course/list'; // Make sure the base URL is correct and complete
    var response = await client.get(Uri.parse(url));

    print("Response for lessons: ${response}");

    if (response.statusCode == 200) {
      try {
        var jsonString = response.body;
        print("Response JSON: $jsonString");

        // Parse the JSON response into LearnResponse model
        var jsonResponse = LearnResponse.fromJson(json.decode(jsonString));

        // Return the list of LearningCourse if successful
        return jsonResponse.learningCourses;
      } catch (e) {
        // Catch and print any errors during JSON parsing
        print("Error parsing response: $e");
        return null;
      }
    } else {
      print("Failed to load lessons. Status code: ${response.statusCode}");
      return null;
    }
  }
}
