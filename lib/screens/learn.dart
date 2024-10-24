import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/controllers/learn_controller.dart';

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
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        course.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Prize Money: \$${course.prizeMoney}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
