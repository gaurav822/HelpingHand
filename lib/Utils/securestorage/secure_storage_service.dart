import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

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
}
