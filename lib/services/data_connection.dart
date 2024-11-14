import 'package:flutter/material.dart';
import 'package:flutter_home_work10/data_base/hive_base.dart';

class DataFetcher extends StatelessWidget {
  DataFetcher({super.key});

  final HiveTransaction hiveTransaction = HiveTransaction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: hiveTransaction.getData('transactionKey'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Збережені дані: ${snapshot.data ?? "Немає даних"}',
                ),
                ElevatedButton(
                  onPressed: () async {
                    await hiveTransaction.saveData(
                      'transactionKey',
                      'Hello from me!!!',
                    );
                    if(context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Дані збережено!'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Зберегти дані',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
