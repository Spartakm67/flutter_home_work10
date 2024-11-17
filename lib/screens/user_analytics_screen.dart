import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';

class UserAnalyticsScreen extends StatelessWidget {
  final TransactionStore transactionStore;

  const UserAnalyticsScreen({super.key, required this.transactionStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter Analytics:'),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) => DropdownButton<String>(
                      value: transactionStore.selectedCategoryForAnalytics,
                      onChanged: (value) {
                        if (value != null) {
                          transactionStore.updateAnalyticsCategory(value);
                        }
                      },
                      items: ['All', ...transactionStore.categories]
                          .map(
                            (cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () async {
                    final pickedRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      initialDateRange: DateTimeRange(
                        start: transactionStore.startDateForAnalytics,
                        end: transactionStore.endDateForAnalytics,
                      ),
                    );

                    if (pickedRange != null) {
                      transactionStore.updateAnalyticsPeriod(
                        pickedRange.start,
                        pickedRange.end,
                      );
                    }
                  },
                  child: const Text('Select Date Range'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Observer(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Income: ${transactionStore.totalIncome.toStringAsFixed(2)}',
                      ),
                      Text(
                        'Total Expense: ${transactionStore.totalExpense.toStringAsFixed(2)}',
                      ),
                      Text(
                        'Most Active Category: ${transactionStore.mostActiveCategory}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25,),
                Observer(
                  builder: (_) => Text(
                    'Selected: \n${transactionStore.startDateForAnalytics.toLocal().toString().split(' ')[0]} - '
                        '\n${transactionStore.endDateForAnalytics.toLocal().toString().split(' ')[0]}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// .toString().split(' ')[0]}


