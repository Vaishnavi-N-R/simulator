import 'package:get/get.dart';
import 'package:trade_simulator/models/user_model.dart';

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  var token = ''.obs; // Holds the token

  // Method to set the user data
  void setUser(Map<String, dynamic> userData) {
    user.value = User.fromJson(userData);
  }

  void setToken(String newToken) {
    token.value = newToken;
  }

  String get authToken => token.value;

  // Method to clear user data
  void clearUser() {
    user.value = null;
  }
}
