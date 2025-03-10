import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/components/learn.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';
import 'package:trade_simulator/widgets/learn/learn_design.dart';

class LearnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final LearnController learnController = Get.put(LearnController());

    return Scaffold(
      body: Obx(() {
        
        print("Learn view Scaffold");
        if (learnController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (learnController.learningCourses.isEmpty) {
          return Center(child: Text("No courses available at the moment."));
        }

        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: // LearnView snippet
                ListView.builder(
              itemCount: learnController.learningCourses.length,
              itemBuilder: (context, index) {
                var course = learnController.learningCourses[index];
                return GestureDetector(
                  onTap: () {
                    learnController.selectCourse(course.id);
                    print("Selected course ID: ${course.id}");
                  },
                  child: LearnDesign(
                    title: course.title,
                    prizeMoney: course.prizeMoney,
                    id: course.id,
                          status: course.status, // Pass the status here

                  ),
                );
              },
            ));
            
      }),
    );
  }
}
