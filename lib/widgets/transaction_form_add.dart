import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/data/models/transaction.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';

class TransactionFormAdd extends StatelessWidget {
  final TransactionStore transactionStore;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TransactionFormAdd({super.key, required this.transactionStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
          'Add Transaction',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return TextFormField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    onChanged: transactionStore.updateAmount,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      final parsedValue = double.tryParse(value);
                      if (parsedValue == null || parsedValue <= 0) {
                        return 'Enter a valid amount greater than zero';
                      }
                      return null;
                    },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: transactionStore.updateDescription,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return DropdownButtonFormField<String>(
                    value: transactionStore.selectedCategory.isEmpty
                        ? null
                        : transactionStore.selectedCategory,
                    items: transactionStore.categories
                        .map(
                          (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                        .toList(),
                    onChanged: transactionStore.updateCategory,
                    decoration: const InputDecoration(labelText: 'Category'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        return Text(
                          'Selected date: ${transactionStore.selectedDate.toLocal().toString().split(' ')[0]}',
                        );
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () => _pickDate(context),
                    child: const Text('Pick Date'),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1.0,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newTransaction = Transaction(
                      amount: transactionStore.amount,
                      description: transactionStore.description,
                      category: transactionStore.selectedCategory,
                      date: transactionStore.selectedDate,
                    );

                    transactionStore.addTransaction(newTransaction);
                    Navigator.of(context).pushNamed('/transactions');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fix the errors in the form'),
                      ),
                    );
                  }
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      transactionStore.updateDate(pickedDate);
    }
  }
}
