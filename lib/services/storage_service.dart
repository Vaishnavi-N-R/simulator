import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = FlutterSecureStorage();

  Future<void> saveUserData(Map<String, dynamic> userData, String token) async {
    await _storage.write(key: 'user_data', value: jsonEncode(userData));
    await _storage.write(key: 'token', value: token);
  }

  Future<Map<String, dynamic>?> getUserData() async {
    String? userData = await _storage.read(key: 'user_data');
    return userData != null ? jsonDecode(userData) : null;
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> clearUserData() async {
    await _storage.deleteAll();
  }
}
