import 'package:flutter/material.dart';
import 'package:flutter_home_work10/screens/home_screen.dart';
import 'package:flutter_home_work10/widgets/transaction_form_add.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';
import 'package:flutter_home_work10/stores/user_settings_store.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';
import 'package:flutter_home_work10/widgets/custom_app_bar.dart';

class UserTransactionsScreen extends StatelessWidget {
  final TransactionStore transactionStore = TransactionStore();

  UserTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userSettings = UserSettingsStore();
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: CustomAppBar(
        title: 'Transactions',
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(transactionStore: transactionStore),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Home'),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      TransactionFormAdd(transactionStore: transactionStore),
                ),
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return transactionStore.transactions.isEmpty
              ? const Center(
                  child: Text(
                    'No transactions yet.',
                    style: TextStyles.greetingsText,
                  ),
                )
              : Column(
                  children: [
                    const Divider(height: 1, thickness: 2),
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactionStore.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction =
                              transactionStore.transactions[index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 12,
                                ),
                                child: ListTile(
                                  title: Text(transaction.description),
                                  subtitle: Text(
                                    '${transaction.category} - ${transaction.date.toLocal().toString().split(' ')[0]}',
                                  ),
                                  trailing: Text(
                                    '${userSettings.currency} ${transaction.amount.toStringAsFixed(2)}',
                                  ),
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text('Delete Transaction'),
                                        content: const Text(
                                          'Are you sure you want to delete this transaction?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              transactionStore
                                                  .deleteTransaction(index);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
