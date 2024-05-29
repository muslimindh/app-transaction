part of '../../../views.dart';

class DeleteTransactionConsumer extends ConsumerWidget with CustomMixin {
  const DeleteTransactionConsumer(this.idTransaction, {super.key});
  final int idTransaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      backgroundColor: CustomColor.red.withOpacity(0.8),
      onTap: () async {
        showLoaderOverlay(context: context);
        final isOnline = await Utility.instance.checkConnection();
        if (isOnline) {
          ref
              .read(transactionProvider.notifier)
              .deleteTransaction(ref, idTransaction);
        } else {
          Get.close(1);
          showCustomPopUp(
            context: context,
            time: 4,
            title: 'Anda sedang offline. Pastikan terhubung dengan internet',
            color: CustomColor.red,
          );
        }
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
