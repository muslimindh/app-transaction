part of '../../../views.dart';

class AddTransactionConsumer extends ConsumerWidget with CustomMixin {
  const AddTransactionConsumer({
    super.key,
    required this.amount,
    required this.type,
    required this.notes,
    required this.formkey,
  });
  final TextEditingController amount;
  final String type;
  final TextEditingController notes;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      onTap: () async {
        if (formkey.currentState!.validate()) {
          String typeConv = type == "Pendapatan" ? 'income' : 'expense';
          Map<String, dynamic> data = {
            'amount': amount.text,
            'type': typeConv,
            'category': notes.text,
          };
          showLoaderOverlay(context: context);
          final isOnline = await Utility.instance.checkConnection();
          if (isOnline) {
            ref.read(transactionProvider.notifier).createTransaction(ref, data);
          } else {
            Get.close(1);
            showCustomPopUp(
              context: context,
              time: 4,
              title: 'Anda sedang offline. Pastikan terhubung dengan internet',
              color: CustomColor.red,
            );
          }
        }
      },
      child: const Center(
        child: Text(
          'Tambah Transaksi',
          style: CustomFont.whiteFont12Semi,
        ),
      ),
    );
  }
}
