import 'package:flutter/material.dart';

class CurrencyItems {
  static final List<String> currencies = ['USD', 'EUR', 'UAH'];

  static List<DropdownMenuItem<String>> getDropdownItems() {
    return currencies
        .map((currency) => DropdownMenuItem(
      value: currency,
      child: Text(currency),
    ))
        .toList();
  }

  static void addCurrency(String currency) {
    if (!currencies.contains(currency)) {
      currencies.add(currency);
    }
  }
}