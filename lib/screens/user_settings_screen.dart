import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/stores/user_settings_store.dart';
import 'package:flutter_home_work10/widgets/add_currency_dialog.dart';
import 'package:flutter_home_work10/widgets/custom_button.dart';
import 'package:flutter_home_work10/widgets/custom_app_bar.dart';

class UserSettingsScreen extends StatelessWidget {
  final UserSettingsStore settingsStore;

  const UserSettingsScreen({super.key, required this.settingsStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'User Settings'),
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
                      items: settingsStore.currencies
                          .map(
                            (currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          settingsStore.updateCurrency(value);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => AddCurrencyDialog.showAddCurrencyDialog(
                      context,
                      settingsStore,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Budget Limit:'),
            const SizedBox(height: 10),
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
            CustomButton(
              onPressed: settingsStore.saveSettings,
              text: 'Save Settings',
            ),
          ],
        ),
      ),
    );
  }
}
