import 'package:flutter/material.dart';

class AddCurrencyDialog extends StatelessWidget {
  final TextEditingController currencyController;
  final VoidCallback onAddCurrency;

  const AddCurrencyDialog({
    super.key,
    required this.currencyController,
    required this.onAddCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Currency'),
      content: TextField(
        controller: currencyController,
        decoration: const InputDecoration(
          labelText: 'Currency Code (e.g., USD)',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onAddCurrency();
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
