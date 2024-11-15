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
budgetLimit: ${budgetLimit}
    ''';
  }
}
