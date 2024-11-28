import 'package:get/get.dart';
import 'package:trade_simulator/models/user_model.dart';

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  // Method to set the user data
  void setUser(Map<String, dynamic> userData) {
    user.value = User.fromJson(userData);
  }

  // Method to clear user data
  void clearUser() {
    user.value = null;
  }
}
