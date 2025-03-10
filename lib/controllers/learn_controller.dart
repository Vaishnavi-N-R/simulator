import 'package:get/get.dart';
import 'package:trade_simulator/models/learn_response.dart';
import 'package:trade_simulator/services/remote_services.dart';

class LearnController extends GetxController {
  var learningCourses = <LearningCourse>[].obs;
  var isLoading = true.obs;
  var category = "defaultCategory".obs;
  var selectedCourseId = RxString(""); // Holds the current course ID

  @override
  void onInit() {
    // Correct lifecycle method
    super.onInit();
    fetchLearningCourses(category.value); // Ensure courses are fetched
  }

  void fetchLearningCourses(String category) async {
    try {
      isLoading(true);
      var response = await RemoteServices.fetchLessons(category);
      if (response != null && response.isNotEmpty) {
        learningCourses.assignAll(response);
        // Set the selected course ID (for simplicity, select the first course)
        if (learningCourses.isNotEmpty) {
          selectedCourseId.value = learningCourses.first.id;
          selectCourse(selectedCourseId.value);
        }
      } else {
        print("No valid courses found in the response.");
      }
    } catch (e) {
      print('Error fetching learning courses: $e');
    } finally {
      isLoading(false);
    }
  }

  void selectCourse(String courseId) {
    selectedCourseId.value = courseId;
    print(
        "Selected course ID updated to: $courseId"); // Debugging print statement
  }
}
