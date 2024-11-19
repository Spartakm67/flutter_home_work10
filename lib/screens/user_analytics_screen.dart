import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_home_work10/stores/transaction_store.dart';
import 'package:flutter_home_work10/styles/text_styles.dart';
import 'package:flutter_home_work10/widgets/custom_button.dart';
import 'package:flutter_home_work10/widgets/custom_app_bar.dart';
import 'package:flutter_home_work10/screens/home_screen.dart';

class UserAnalyticsScreen extends StatelessWidget {
  final TransactionStore transactionStore;

  const UserAnalyticsScreen({super.key, required this.transactionStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Analytics',
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(transactionStore: transactionStore),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Home'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Analytics:',
              style: TextStyles.defaultText,
            ),
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
                  style: TextStyles.textButtonStyle,
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
                        style: TextStyles.userText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Total Expense:'
                        ' ${transactionStore.totalExpense.toStringAsFixed(2)}',
                        style: TextStyles.userText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Most Active Category:'
                        '\n ${transactionStore.mostActiveCategory}',
                        style: TextStyles.userText,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Observer(
                  builder: (_) => Text(
                    'Selected Date Range: \n${transactionStore.startDateForAnalytics.toLocal().toString().split(' ')[0]} - '
                    '${transactionStore.endDateForAnalytics.toLocal().toString().split(' ')[0]}',
                    style: TextStyles.userText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Observer(
              builder: (_) => CustomButton(
                onPressed: () {
                  transactionStore.saveAnalyticsToDatabase();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Analytics saved!')),
                  );
                },
                text: 'Save Analytics',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
