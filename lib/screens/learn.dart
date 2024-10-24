import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';
import 'package:trade_simulator/widgets/learn/learn_design.dart';

class LearnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LearnController learnController = Get.put(LearnController());

    return Scaffold(
      body: Obx(() {
        if (learnController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (learnController.learningCourses.isEmpty) {
          return Center(child: Text("No courses available at the moment."));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: learnController.learningCourses.length,
            itemBuilder: (context, index) {
              var course = learnController.learningCourses[index];

              // Use the LearnDesign widget here
              return LearnDesign(
                title: course.title,
                prizeMoney: course.prizeMoney,
              );
            },
          ),
        );
      }),
    );
  }
}
