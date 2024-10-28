import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trade_simulator/components/learn.dart';
import 'package:trade_simulator/components/learn_detail_screen.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';

class LearnDetails extends StatelessWidget {
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
              return LearnDetailScreen(
                title: course.title,
                content: course.content,
                id:course.id
              );
            },
          ),
        );
      }),
    );
  }
}