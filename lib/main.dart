import 'package:flutter/material.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_home_work10/data/database/hive_box_names.dart';
import 'package:flutter_home_work10/data/models/analytics.dart';
import 'package:flutter_home_work10/data/models/transaction.dart';
import 'package:flutter_home_work10/data/models/user_settings.dart';
import 'package:flutter_home_work10/screens/screens.dart';
import 'package:flutter_home_work10/stores/user_settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(UserSettingsAdapter());
  Hive.registerAdapter(AnalyticsAdapter());

  await Hive.openBox<UserSettings>(HiveBoxNames.userSettingsBox);
  await Hive.openBox<Analytics>(HiveBoxNames.analyticsBox);
  await Hive.openBox<String>(HiveBoxNames.currenciesBox);

  final userSettingsStore = UserSettingsStore();
  await userSettingsStore.loadSettings();
  await userSettingsStore.loadCurrencies();

  runApp(MyApp(userSettingsStore: userSettingsStore));
}

class MyApp extends StatelessWidget {
  final UserSettingsStore userSettingsStore;
  final transactionStore = TransactionStore();

  MyApp({super.key, required this.userSettingsStore});

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
        '/': (context) => HomeScreen(transactionStore: transactionStore),
        '/settings': (context) => UserSettingsScreen(settingsStore: userSettingsStore),
        '/transactions': (context) => UserTransactionsScreen(),
        '/analytics': (context) => UserAnalyticsScreen(transactionStore: transactionStore),
      },
    );
  }
}


