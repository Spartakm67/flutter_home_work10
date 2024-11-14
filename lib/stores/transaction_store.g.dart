// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on BaseTransactionStore, Store {
  late final _$amountAtom =
      Atom(name: 'BaseTransactionStore.amount', context: context);

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

  late final _$descriptionAtom =
      Atom(name: 'BaseTransactionStore.description', context: context);

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

  late final _$categoryAtom =
      Atom(name: 'BaseTransactionStore.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$dateAtom =
      Atom(name: 'BaseTransactionStore.date', context: context);

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  bool _dateIsInitialized = false;

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, _dateIsInitialized ? super.date : null, () {
      super.date = value;
      _dateIsInitialized = true;
    });
  }

  late final _$BaseTransactionStoreActionController =
      ActionController(name: 'BaseTransactionStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$BaseTransactionStoreActionController.startAction(
        name: 'BaseTransactionStore.increment');
    try {
      return super.increment();
    } finally {
      _$BaseTransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
description: ${description},
category: ${category},
date: ${date}
    ''';
  }
}
