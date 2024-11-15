import 'package:flutter/material.dart';
import 'package:flutter_home_work10/data/models/analytics.dart';
import 'package:flutter_home_work10/data/models/transaction.dart';
import 'package:flutter_home_work10/data/models/user_settings.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_home_work10/screens/screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(UserSettingsAdapter());
  Hive.registerAdapter(AnalyticsAdapter());

  await Hive.openBox<Transaction>('transactionsBox');
  await Hive.openBox<UserSettings>('userSettingsBox');
  await Hive.openBox<Analytics>('analyticsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter HW10',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const UserSettingsScreen(),
        '/transactions': (context) => const UserTransactionsScreen(),
        '/analytics': (context) => const UserAnalyticsScreen(),
      },
    );
  }
}

// var transactionBox = await Hive.openBox<Transaction>('transactionBox');
// var userSettingsBox = await Hive.openBox<UserSettings>('userSettingsBox');
// var analyticsBox = await Hive.openBox<Analytics>('analyticsBox');

// var transactionsBox = Hive.box('transactionsBox');
// var userSettingsBox = Hive.box('userSettingsBox');
// var analyticsBox = Hive.box('analyticsBox');


// class TransactionStore = _TransactionStore with _$TransactionStore;
//
// abstract class _TransactionStore with Store {
//   @observable
//   ObservableList<Transaction> transactions = ObservableList<Transaction>();
//
//   @action
//   Future<void> addTransaction(Transaction transaction) async {
//     await transactionBox.add(transaction);
//     transactions.add(transaction);
//   }
// }

// // Збереження транзакції
// await transactionBox.put('transactionKey', Transaction(...));
//
// // Отримання налаштувань користувача
// UserSettings? settings = userSettingsBox.get('settingsKey');