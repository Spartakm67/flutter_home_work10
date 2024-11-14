import 'package:mobx/mobx.dart';

part 'transaction_store.g.dart';

class TransactionStore = BaseTransactionStore with _$TransactionStore;

abstract class BaseTransactionStore with Store {
  @observable
  double amount = 0;

  @observable
  String description = '';

  @observable
  String category = '';

  @observable
  late DateTime date;

  @action
  void increment() {

  }
}
