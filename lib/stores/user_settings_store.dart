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

  @observable
  ObservableList<String> currencies = ObservableList.of([]);

  late Box<String> currencyBox;

  static const List<String> defaultCurrencies = ['USD', 'EUR', 'UAH', 'PNL'];

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

  @action
  Future<void> loadCurrencies() async {
    currencyBox = await Hive.openBox<String>('currenciesBox');

    if (currencyBox.isEmpty) {
      for (final String currency in defaultCurrencies) {
        await currencyBox.put(currency, currency);
      }
    }
    currencies = ObservableList.of(currencyBox.values.toList());
  }

  @action
  Future<void> addCurrency(String currency) async {
    if (!currencies.contains(currency)) {
      await currencyBox.put(currency, currency);

      currencies.add(currency);
    }
  }

  @action
  Future<void> deleteCurrency(String currency) async {
    if (currencies.contains(currency)) {
      currencies.remove(currency);
      await currencyBox.delete(currency);
    }
  }
}