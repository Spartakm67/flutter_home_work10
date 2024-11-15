import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:flutter_home_work10/data/database/hive_box_names.dart';
import 'package:flutter_home_work10/data/models/user_settings.dart';

part 'user_settings_store.g.dart';

class UserSettingsStore = BaseUserSettingsStore with _$UserSettingsStore;

abstract class BaseUserSettingsStore with Store {

  @observable
  String currency = 'USD';

  @observable
  double budgetLimit = 0.0;


  @action
  Future<void> loadSettings() async {
    final box = await Hive.openBox<UserSettings>(HiveBoxNames.userSettingsBox);
    final settings = box.get('userSettings');
    if (settings != null) {
      currency = settings.currency;
      budgetLimit = settings.budgetLimit;
    }
  }

  @action
  Future<void> saveSettings() async {
    final box = await Hive.openBox<UserSettings>(HiveBoxNames.userSettingsBox);
    final settings = UserSettings(currency: currency, budgetLimit: budgetLimit);
    await box.put('userSettings', settings);
  }

  @action
  void updateCurrency(String newCurrency) {
    currency = newCurrency;
  }

  @action
  void updateBudgetLimit(String limit) {
    final parsedLimit = double.tryParse(limit);
    if (parsedLimit != null) {
      budgetLimit = parsedLimit;
    }
  }
}