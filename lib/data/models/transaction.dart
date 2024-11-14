import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final DateTime date;

  Transaction({
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
  });
}
