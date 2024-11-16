import 'package:flutter/material.dart';
import 'package:flutter_home_work10/widgets/transaction_form_add.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';

class UserTransactionsScreen extends StatelessWidget {
  final TransactionStore transactionStore = TransactionStore();

  UserTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
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
              ? const Center(child: Text('No transactions yet.'))
              : ListView.builder(
                  itemCount: transactionStore.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionStore.transactions[index];
                    return ListTile(
                      title: Text(transaction.description),
                      subtitle: Text(
                        '${transaction.category} - ${transaction.date.toLocal().toString().split(' ')[0]}',
                      ),
                      trailing:
                          Text('\$${transaction.amount.toStringAsFixed(2)}'),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete Transaction'),
                            content: const Text(
                                'Are you sure you want to delete this transaction?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  transactionStore.deleteTransaction(index);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
