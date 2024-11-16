import 'package:flutter/material.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';
import 'package:flutter_home_work10/widgets/transaction_form_add.dart';
import 'package:flutter_home_work10/widgets/custom_button.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';

class HomeScreen extends StatelessWidget {
  final TransactionStore transactionStore;

  const HomeScreen({super.key, required this.transactionStore});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: const Text('My Finance App'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyles.styledText('Welcome!', TextStyles.greetingsText),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              text: 'User Settings',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TransactionFormAdd(
                      transactionStore: transactionStore,
                    ),
                  ),
                );
              },
              text: 'Add Transaction',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transactions');
              },
              text: 'Transaction List',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/analytics');
              },
              text: 'Analytics',
            ),
          ],
        ),
      ),
    );
  }
}
