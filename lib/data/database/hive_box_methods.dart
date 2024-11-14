import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> saveData<T>(String boxName, String key, T value) async {
    var box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  Future<T?> getData<T>(String boxName, String key) async {
    var box = await openBox<T>(boxName);
    return box.get(key);
  }

  Future<void> deleteData<T>(String boxName, String key) async {
    var box = await openBox<T>(boxName);
    await box.delete(key);
  }
}
