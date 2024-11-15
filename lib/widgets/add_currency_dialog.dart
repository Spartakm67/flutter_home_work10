import 'package:flutter/material.dart';
import 'package:flutter_home_work10/stores/user_settings_store.dart';

class AddCurrencyDialog {

  static void showAddCurrencyDialog(BuildContext context, UserSettingsStore settingsStore) {
    final TextEditingController currencyController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Add New Currency'),
          content: TextField(
            controller: currencyController,
            decoration: const InputDecoration(
              hintText: 'Enter currency code (e.g., GBP)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newCurrency =
                    currencyController.text.toUpperCase().trim();
                if (newCurrency.isNotEmpty) {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);
                  await settingsStore.addCurrency(newCurrency);
                  settingsStore.updateCurrency(newCurrency);
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('$newCurrency added to currencies')),
                  );
                  navigator.pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
