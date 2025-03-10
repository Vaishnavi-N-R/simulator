import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveUserData(Map<String, dynamic> userData, String token) async {
    try {
      await _storage.write(key: 'user_data', value: jsonEncode(userData));
      await _storage.write(key: 'token', value: token);
      print('User data and token saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      String? userData = await _storage.read(key: 'user_data');
      return userData != null ? jsonDecode(userData) : null;
    } catch (e) {
      print('Error reading user data: $e');
      return null;
    }
  }

  Future<String?> getToken() async {
    try {
      String? token = await _storage.read(key: 'token');
      print('Retrieved token: $token');
      return token;
    } catch (e) {
      print('Error reading token: $e');
      return null;
    }
  }

  Future<void> clearUserData() async {
    try {
      await _storage.deleteAll();
      print('User data cleared successfully');
    } catch (e) {
      print('Error clearing user data: $e');
    }
  }
}
