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
    debugPrint('Data being sent: $dataTransaction');
    ref.read(createTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Future.delayed(const Duration(seconds: 2), () {
          ref.refresh(listDatatransactionProvider);
          Get.back();
        });
        debugPrint('$state');
      },
      onError: (error) {
        state = '$error';
      },
    );
  }

  void deleteTransaction(WidgetRef ref, int dataTransaction) {
    ref.read(deleteTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        ref.refresh(listDatatransactionProvider);
        Get.back();
        debugPrint('$state');
      },
      onError: (error) {
        state = '$error';
      },
    );
  }
}
