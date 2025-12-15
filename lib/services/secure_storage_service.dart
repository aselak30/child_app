import 'dart:convert';
import 'dart:developer';

import 'package:chilld_app/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageManager {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // ---------- SAFE READ ----------
  Future<String?> _safeRead(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      // BAD_DECRYPT → delete corrupted key
      await _storage.delete(key: key);
      log("SecureStorage decrypt failed for $key → key deleted");
      return null;
    }
  }

  // ---------- TOKEN ----------
  Future<void> storeToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _safeRead('token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  // ---------- USER ID ----------
  Future<void> storeUserId(String userId) async {
    await _storage.write(key: 'user_id', value: userId);
  }

  Future<String?> getUserId() async {
    return await _safeRead('user_id');
  }

  Future<void> deleteUserId() async {
    await _storage.delete(key: 'user_id');
  }

  // ---------- ROLE ----------
  Future<void> storeRole(String role) async {
    await _storage.write(key: 'role', value: role);
  }

  Future<String?> getRole() async {
    return await _safeRead('role');
  }

  // ---------- DELETE ALL ----------
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  // ---------- SHARED PREF USER ----------
  static Future<void> saveUser({required LoginModel user}) async {
    String userData = json.encode(user.toJson());
    log(userData);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("USER", userData);
  }

  static Future<LoginModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("USER");
    if (user == null) return null;

    log(user);
    return LoginModel.fromJson(json.decode(user));
  }
}
