import 'package:flutter/material.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';
import 'package:flutter_home_work10/widgets/transaction_form_add.dart';
import 'package:flutter_home_work10/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Finance App'),
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
                  MaterialPageRoute(builder: (_) => const TransactionFormAdd()),
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

