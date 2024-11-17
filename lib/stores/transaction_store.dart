import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:flutter_home_work10/data/database/hive_box_names.dart';
import 'package:flutter_home_work10/data/models/transaction.dart';
import 'package:flutter_home_work10/data/models/analytics.dart';

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
      double parsedAmount = double.tryParse(amt) ?? 0.0;

      if (selectedCategory == 'Wage' || selectedCategory == 'Other income') {
        amount = parsedAmount;
      } else {
        amount = -parsedAmount;
      }
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

  @observable
  String selectedCategoryForAnalytics = 'All';

  @observable
  DateTime startDateForAnalytics = DateTime(DateTime.now().year, DateTime.now().month, 1);

  @observable
  DateTime endDateForAnalytics = DateTime.now();

  @computed
  double get totalIncome {
    return transactions
        .where((t) =>
    t.amount > 0 &&
        (selectedCategoryForAnalytics == 'All' || t.category == selectedCategoryForAnalytics) &&
        t.date.isAfter(startDateForAnalytics) &&
        t.date.isBefore(endDateForAnalytics),)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  @computed
  double get totalExpense {
    return transactions
        .where((t) =>
    t.amount < 0 &&
        (selectedCategoryForAnalytics == 'All' || t.category == selectedCategoryForAnalytics) &&
        t.date.isAfter(startDateForAnalytics) &&
        t.date.isBefore(endDateForAnalytics),)
        .fold(0.0, (sum, t) => sum + t.amount.abs());
  }

  @computed
  String get mostActiveCategory {
    final Map<String, double> categoryTotals = {};

    for (var t in transactions) {
      if (t.amount < 0 &&
          t.date.isAfter(startDateForAnalytics) &&
          t.date.isBefore(endDateForAnalytics)) {
        categoryTotals[t.category] = (categoryTotals[t.category] ?? 0) + t.amount.abs();
      }
    }

    if (categoryTotals.isEmpty) return 'Not selected';

    return categoryTotals.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  @action
  void updateAnalyticsPeriod(DateTime start, DateTime end) {
    startDateForAnalytics = start;
    endDateForAnalytics = end;
  }

  @action
  void updateAnalyticsCategory(String category) {
    selectedCategoryForAnalytics = category;
  }

  @action
  Future<void> saveAnalyticsToDatabase() async {
    final analytics = Analytics(
      totalIncome: totalIncome,
      totalExpense: totalExpense,
      category: mostActiveCategory,
    );
    final analyticsBox = await Hive.openBox<Analytics>('analyticsBox');
    await analyticsBox.add(analytics);
  }
}
