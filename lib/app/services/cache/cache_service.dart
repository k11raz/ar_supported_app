import 'dart:convert';
import 'dart:developer';

import 'package:bus/app/services/cache/i_cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService implements ICacheService {
  @override
  Future<T?> read<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) return prefs.getString(key) as T?;
    if (T == int) return prefs.getInt(key) as T?;
    if (T == bool) return prefs.getBool(key) as T?;
    if (T == double) return prefs.getDouble(key) as T?;
    if (T == List<String>) return prefs.getStringList(key) as T?;

    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      if (T == String) return jsonString as T;
      log('Read result: $jsonString');
      return jsonDecode(jsonString) as T;
    }
    return null;
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    log('remove result ${prefs.toString()}');
    await prefs.remove(key);
  }

  @override
Future<void> write(String key, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  String stringValue;

  if (value is String) {
    stringValue = value;
  } else {
    stringValue = jsonEncode(value);
  }

  log('write result: $stringValue');
  await prefs.setString(key, stringValue);
}

}
