part of '../viewmodels.dart';

final transactionProvider =
    StateNotifierProvider((ref) => TransactionViewModel(ref));

class TransactionViewModel extends StateNotifier {
  TransactionViewModel(super.state);

  void loadTransactions(WidgetRef ref) {
    ref.read(listDatatransactionProvider).when(
          data: (transactions) => state = transactions,
          error: (err, _) {
            debugPrint('$err');
          },
          loading: () {
            debugPrint('loading');
          },
        );
  }

  void createTransaction(WidgetRef ref, Map<String, dynamic> dataTransaction) {
    ref.read(createTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        debugPrint('$state');
      },
      onError: (error) {
        state = '$error';
      },
    );
  }
}
