import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:flutter_home_work10/data/database/hive_box_names.dart';
import 'package:flutter_home_work10/data/models/transaction.dart';

part 'transaction_store.g.dart';

class TransactionStore = TransactionStoreBase with _$TransactionStore;

abstract class TransactionStoreBase with Store {
  late Box<Transaction> transactionBox;

  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>();

  @observable
  ObservableList<String> categories = ObservableList<String>.of([
    'Food',
    'Transport',
    'Entertainment',
    'Clothing',
    'Financial',
    'Car',
    'Wage',
    'Other income',
  ]);

  @observable
  String selectedCategory = 'Food';

  @observable
  String description = '';

  @observable
  double amount = 0.0;

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void updateCategory(String? category) {
    selectedCategory = category ?? '';
  }

  @action
  void updateDescription(String desc) {
    description = desc;
  }

  @action
  void updateAmount(String? amt) {
    if (amt == null || amt.isEmpty) {
      amount = 0.0;
    } else {
      amount = double.tryParse(amt) ?? 0.0;
    }
  }

  @action
  void updateDate(DateTime date) {
    selectedDate = date;
  }

  TransactionStoreBase() {
    _init();
  }

  Future<void> _init() async {

    transactionBox =
        await Hive.openBox<Transaction>(HiveBoxNames.transactionBox);

    transactions.addAll(transactionBox.values.toList());
  }

  @action
  Future<void> addTransaction(Transaction transaction) async {
    await transactionBox.add(transaction);
    transactions.add(transaction);
  }

  @action
  Future<void> deleteTransaction(int index) async {
    await transactionBox.deleteAt(index);
    transactions.removeAt(index);
  }

  @action
  void addCategory(String category) {
    categories.add(category);
  }

  @action
  void removeCategory(String category) {
    categories.remove(category);
  }
}
