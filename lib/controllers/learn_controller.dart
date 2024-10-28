import 'package:get/get.dart';
import 'package:trade_simulator/models/learn_response.dart';
import 'package:trade_simulator/services/remote_services.dart';

class LearnController extends GetxController {
  var learningCourses = <LearningCourse>[].obs;
  var isLoading = true.obs;
  var category = "defaultCategory".obs; // Placeholder for category if needed

  @override
  void onInit() {
    fetchLearningCourses(category.value);
    super.onInit();
  }

  void fetchLearningCourses(String category) async {
    try {
      isLoading(true);

      // Fetch the courses from your API
      var response = await RemoteServices.fetchLessons(category);

      if (response != null) {
        // Ensure that each course has all the necessary properties
        response = response.where((course) {
          return course.title.isNotEmpty &&
              course.content.isNotEmpty &&
              course.status.isNotEmpty; // Adjust conditions as per your need
        }).toList();

        // Assign the filtered courses to the list
        learningCourses.assignAll(response);
      }
    } catch (e) {
      print('Error fetching learning courses: $e');
    } finally {
      isLoading(false);
    }
  }
}
