import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/app.dart';
import 'package:trade_simulator/controllers/user_controller.dart';  // Ensure correct import path

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Register UserController
  Get.put(UserController());  // Add this line
  
  runApp(App());
}
