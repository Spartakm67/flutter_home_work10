import 'package:flutter/material.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';
import 'package:flutter_home_work10/widgets/transaction_form_add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Finance App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyles.styledText('Welcome!', TextStyles.greetingsText),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text(
                'User Settings', style: TextStyles.buttonText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TransactionFormAdd()),
                );
              },
              child: const Text(
                'Add Transaction', style: TextStyles.buttonText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transactions');
              },
              child: const Text(
                'Transaction List', style: TextStyles.buttonText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/analytics');
              },
              child: const Text(
                'Analytics', style: TextStyles.buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

