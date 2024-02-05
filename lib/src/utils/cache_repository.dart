import 'package:hive/hive.dart';

abstract class CacheRepository<T> {
  Future<void> saveInCache({required T value, required dynamic key});

  dynamic getFromCache({required dynamic key});

  Future<void> clearCache();
}

class HiveCache<T> implements CacheRepository<T> {
  final Box _box;

  HiveCache(this._box);

  @override
  Future<void> clearCache() async {
    await _box.deleteAll(_box.keys);
  }

  @override
  dynamic getFromCache({required key}) {
    return _box.get(key);
  }

  @override
  Future<void> saveInCache({required T value, required dynamic key}) async {
    if (_box.isOpen) {
      await _box.put(key, value);
    }
    _box.get('bimesters');
  }
}
