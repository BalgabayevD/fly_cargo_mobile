import 'package:cookie_jar/cookie_jar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieJarStorage implements Storage {
  late final SharedPreferences sharedPreferences;

  final _prefix = 'cookie_jar_store_';

  CookieJarStorage(this.sharedPreferences);

  @override
  Future<void> init([
    bool persistSession = true,
    bool ignoreExpires = false,
  ]) async {}

  @override
  Future<void> write(String key, Object value) async {
    await sharedPreferences.setString(_prefix + key, value.toString());
  }

  @override
  Future<String?> read(String key) async {
    return sharedPreferences.getString(_prefix + key);
  }

  @override
  Future<void> delete(String key) async {
    await sharedPreferences.remove(_prefix + key);
  }

  Future<void> clear() async {
    var keys = sharedPreferences.getKeys();
    for (String key in keys) {
      if (key.startsWith(_prefix)) {
        await sharedPreferences.remove(key);
      }
    }
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    for (var key in keys) {
      await sharedPreferences.remove(_prefix + key);
    }
  }
}
