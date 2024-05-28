part of '../../../views.dart';

class FloatingButtonConsumer extends ConsumerWidget with CustomMixin {
  const FloatingButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsyncValue = ref.watch(listDatatransactionProvider);
    return transactionAsyncValue.when(
      data: (transactions) {
        if (transactions.isNotEmpty) {
          return widgetButton();
        } else {
          return widgetButton();
        }
      },
      loading: () => Container(),
      error: (err, stack) => Container(),
    );
  }

  Widget widgetButton() {
    return InkWell(
      onTap: () {
        Get.to(() => const AddTransactionPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
        decoration: themeDecoration(color: CustomColor.theme),
        child: const Text(
          'Tambah Transaksi',
          style: CustomFont.whiteFont12Semi,
        ),
      ),
    );
  }
}
