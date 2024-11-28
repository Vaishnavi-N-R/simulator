import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_simulator/app.dart';
import 'package:trade_simulator/controllers/user_controller.dart';

void main() {
    Get.put(UserController());  // Initialize UserController

  runApp(const App());
} 