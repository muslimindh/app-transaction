part of '../../../views.dart';

class DeleteTransactionConsumer extends ConsumerWidget with CustomMixin {
  const DeleteTransactionConsumer(this.idTransaction, {super.key});
  final int idTransaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      backgroundColor: CustomColor.red.withOpacity(0.8),
      onTap: () {
        ref
            .read(transactionProvider.notifier)
            .deleteTransaction(ref, idTransaction);
      },
      child: const Center(
        child: Text(
          'Hapus Transaksi',
          style: CustomFont.whiteFont12Semi,
        ),
      ),
    );
  }
}
