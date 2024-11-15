import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/data/database/currency_items.dart';
import 'package:flutter_home_work10/stores/user_settings_store.dart';

class UserSettingsScreen extends StatelessWidget {
  final UserSettingsStore settingsStore;

  const UserSettingsScreen({super.key, required this.settingsStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Currency:'),
            Observer(
              builder: (_) => Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: settingsStore.currency,
                      items: CurrencyItems.getDropdownItems(),
                      onChanged: (value) {
                        if (value != null) {
                          settingsStore.updateCurrency(value);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _showAddCurrencyDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Budget Limit:'),
            Observer(
              builder: (_) => TextFormField(
                initialValue: settingsStore.budgetLimit.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter budget limit',
                ),
                keyboardType: TextInputType.number,
                onChanged: settingsStore.updateBudgetLimit,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: settingsStore.saveSettings,
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCurrencyDialog(BuildContext context) {
    final TextEditingController currencyController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newCurrency = currencyController.text.toUpperCase().trim();
                if (newCurrency.isNotEmpty) {
                  CurrencyItems.addCurrency(newCurrency);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$newCurrency added to currencies')),
                  );
                  Navigator.of(context).pop();
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
