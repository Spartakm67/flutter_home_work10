// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on TransactionStoreBase, Store {
  late final _$transactionsAtom =
      Atom(name: 'TransactionStoreBase.transactions', context: context);

  @override
  ObservableList<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'TransactionStoreBase.categories', context: context);

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: 'TransactionStoreBase.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'TransactionStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$amountAtom =
      Atom(name: 'TransactionStoreBase.amount', context: context);

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: 'TransactionStoreBase.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$addTransactionAsyncAction =
      AsyncAction('TransactionStoreBase.addTransaction', context: context);

  @override
  Future<void> addTransaction(Transaction transaction) {
    return _$addTransactionAsyncAction
        .run(() => super.addTransaction(transaction));
  }

  late final _$deleteTransactionAsyncAction =
      AsyncAction('TransactionStoreBase.deleteTransaction', context: context);

  @override
  Future<void> deleteTransaction(int index) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(index));
  }

  late final _$TransactionStoreBaseActionController =
      ActionController(name: 'TransactionStoreBase', context: context);

  @override
  void updateCategory(String? category) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.updateCategory');
    try {
      return super.updateCategory(category);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDescription(String desc) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.updateDescription');
    try {
      return super.updateDescription(desc);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAmount(String? amt) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.updateAmount');
    try {
      return super.updateAmount(amt);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDate(DateTime date) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.updateDate');
    try {
      return super.updateDate(date);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCategory(String category) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.addCategory');
    try {
      return super.addCategory(category);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(String category) {
    final _$actionInfo = _$TransactionStoreBaseActionController.startAction(
        name: 'TransactionStoreBase.removeCategory');
    try {
      return super.removeCategory(category);
    } finally {
      _$TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
categories: ${categories},
selectedCategory: ${selectedCategory},
description: ${description},
amount: ${amount},
selectedDate: ${selectedDate}
    ''';
  }
}
