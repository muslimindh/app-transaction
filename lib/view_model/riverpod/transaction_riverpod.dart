part of '../viewmodels.dart';

class TransactionViewModel extends StateNotifier<List<DataTransaction>> {
  TransactionViewModel() : super([]);

  void loadTransactions(WidgetRef ref) {
    ref.read(listDatatransactionProvider).when(
          data: (transactions) => state = transactions,
          error: (err, _) => state = [],
          loading: () => state = [],
        );
  }
}
