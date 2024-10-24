import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';

class LearnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LearnController learnController = Get.put(LearnController());

    return Obx(() {
      if (learnController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        itemCount: learnController.learningCourses.length,
        itemBuilder: (context, index) {
          var course = learnController.learningCourses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.content),
          );
        },
      );
    });
  }
}
