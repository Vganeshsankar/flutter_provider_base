import 'package:get_storage/get_storage.dart';

/// Define your environments
enum AppEnv { dev, live }

/// Singleton EnvStorage utility
class StorageHelper {
  static late final AppEnv _env;
  static late final GetStorage _storage;

  /// Initialize storage with environment
  static Future<void> init(AppEnv env) async {
    _env = env;
    await GetStorage.init(env.name); // each env has its own box
    _storage = GetStorage(env.name);
  }

  /// Write a value
  static Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// Read a value
  static T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  /// Remove a value
  static Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  /// Clear all keys for this ENV
  static Future<void> clear() async {
    await _storage.erase();
  }

  /// Current environment
  static AppEnv get env => _env;
}
