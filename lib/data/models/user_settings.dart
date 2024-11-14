import 'package:hive/hive.dart';

part 'user_settings.g.dart';

@HiveType(typeId: 1)
class UserSettings {
  @HiveField(0)
  final String currency;

  @HiveField(1)
  final double budgetLimit;

  UserSettings({required this.currency, required this.budgetLimit});
}