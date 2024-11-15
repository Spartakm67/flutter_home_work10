// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSettingsStore on BaseUserSettingsStore, Store {
  late final _$currencyAtom =
      Atom(name: 'BaseUserSettingsStore.currency', context: context);

  @override
  String get currency {
    _$currencyAtom.reportRead();
    return super.currency;
  }

  @override
  set currency(String value) {
    _$currencyAtom.reportWrite(value, super.currency, () {
      super.currency = value;
    });
  }

  late final _$budgetLimitAtom =
      Atom(name: 'BaseUserSettingsStore.budgetLimit', context: context);

  @override
  double get budgetLimit {
    _$budgetLimitAtom.reportRead();
    return super.budgetLimit;
  }

  @override
  set budgetLimit(double value) {
    _$budgetLimitAtom.reportWrite(value, super.budgetLimit, () {
      super.budgetLimit = value;
    });
  }

  late final _$currenciesAtom =
      Atom(name: 'BaseUserSettingsStore.currencies', context: context);

  @override
  ObservableList<String> get currencies {
    _$currenciesAtom.reportRead();
    return super.currencies;
  }

  @override
  set currencies(ObservableList<String> value) {
    _$currenciesAtom.reportWrite(value, super.currencies, () {
      super.currencies = value;
    });
  }

  late final _$loadSettingsAsyncAction =
      AsyncAction('BaseUserSettingsStore.loadSettings', context: context);

  @override
  Future<void> loadSettings() {
    return _$loadSettingsAsyncAction.run(() => super.loadSettings());
  }

  late final _$saveSettingsAsyncAction =
      AsyncAction('BaseUserSettingsStore.saveSettings', context: context);

  @override
  Future<void> saveSettings() {
    return _$saveSettingsAsyncAction.run(() => super.saveSettings());
  }

  late final _$loadCurrenciesAsyncAction =
      AsyncAction('BaseUserSettingsStore.loadCurrencies', context: context);

  @override
  Future<void> loadCurrencies() {
    return _$loadCurrenciesAsyncAction.run(() => super.loadCurrencies());
  }

  late final _$addCurrencyAsyncAction =
      AsyncAction('BaseUserSettingsStore.addCurrency', context: context);

  @override
  Future<void> addCurrency(String currency) {
    return _$addCurrencyAsyncAction.run(() => super.addCurrency(currency));
  }

  late final _$deleteCurrencyAsyncAction =
      AsyncAction('BaseUserSettingsStore.deleteCurrency', context: context);

  @override
  Future<void> deleteCurrency(String currency) {
    return _$deleteCurrencyAsyncAction
        .run(() => super.deleteCurrency(currency));
  }

  late final _$BaseUserSettingsStoreActionController =
      ActionController(name: 'BaseUserSettingsStore', context: context);

  @override
  void updateCurrency(String newCurrency) {
    final _$actionInfo = _$BaseUserSettingsStoreActionController.startAction(
        name: 'BaseUserSettingsStore.updateCurrency');
    try {
      return super.updateCurrency(newCurrency);
    } finally {
      _$BaseUserSettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBudgetLimit(String limit) {
    final _$actionInfo = _$BaseUserSettingsStoreActionController.startAction(
        name: 'BaseUserSettingsStore.updateBudgetLimit');
    try {
      return super.updateBudgetLimit(limit);
    } finally {
      _$BaseUserSettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currency: ${currency},
budgetLimit: ${budgetLimit},
currencies: ${currencies}
    ''';
  }
}
