import 'package:hive_flutter/hive_flutter.dart';

class HiveTransaction {
  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox('transactionBox');
  }

  Future<void> saveData(String key, String value) async {
    var box = Hive.box('transactionBox');
    await box.put(key, value);
  }

  Future<String?> getData(String key) async {
    var box = Hive.box('transactionBox');
    return box.get(key);
  }
}



