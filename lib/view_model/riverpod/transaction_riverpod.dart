part of '../viewmodels.dart';

final transactionProvider =
    StateNotifierProvider((ref) => TransactionViewModel(ref));

class TransactionViewModel extends StateNotifier with CustomMixin {
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

  void createTransaction(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> dataTransaction,
  ) {
    debugPrint('Data being sent: $dataTransaction');
    ref.read(createTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Get.close(2);
        debugPrint('$state');
        return ref.refresh(listDatatransactionProvider);
      },
      onError: (error) {
        Get.close(1);
        showCustomPopUp(
          context: context,
          title: 'Terjadi kesalahan server',
          color: CustomColor.red,
        );
      },
    );
  }

  void deleteTransaction(
    BuildContext context,
    WidgetRef ref,
    int dataTransaction,
  ) {
    ref.read(deleteTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Get.close(2);
        debugPrint('$state');
        return ref.refresh(listDatatransactionProvider);
      },
      onError: (error) {
        Get.close(1);
        showCustomPopUp(
          context: context,
          title: 'Terjadi kesalahan server',
          color: CustomColor.red,
        );
      },
    );
  }
}
