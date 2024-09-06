import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:helpinghand/Utils/constants.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  // Save value to secure storage
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read value from secure storage
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete value from secure storage
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Clear all values from secure storage
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  Future<void> storeToken(String token, int expiresIn) async {
    // Store the token
    await _secureStorage.write(key: AppConstants.accessToken, value: token);

    // Store the expiration time
    final expirationTime = DateTime.now().add(Duration(seconds: expiresIn));
    await _secureStorage.write(key: AppConstants.tokenExpiration, value: expirationTime.toIso8601String());
  }

  Future<bool> isTokenValid() async {
    // Retrieve expiration time from storage
    String? expirationTimeString = await _secureStorage.read(key: AppConstants.tokenExpiration);

    if (expirationTimeString != null) {
      final expirationTime = DateTime.parse(expirationTimeString);
      return expirationTime.isAfter(DateTime.now());
    }

    return false;
  }

  Future<void> deleteAll() async {
    _secureStorage.deleteAll();
  }

}
