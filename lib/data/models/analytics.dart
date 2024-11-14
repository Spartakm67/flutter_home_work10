import 'package:hive/hive.dart';

part 'analytics.g.dart';

@HiveType(typeId: 2)
class Analytics {
  @HiveField(0)
  final double totalIncome;

  @HiveField(1)
  final double totalExpense;

  @HiveField(2)
  final double expenseItem;

  Analytics({required this.totalIncome, required this.totalExpense, required this.expenseItem});
}