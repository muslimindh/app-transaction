part of '../../../views.dart';

class AddTransactionConsumer extends ConsumerWidget {
  const AddTransactionConsumer({
    super.key,
    required this.amount,
    required this.type,
    required this.notes,
    required this.formkey,
  });
  final String amount;
  final String type;
  final String notes;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      onTap: () {
        if (formkey.currentState!.validate()) {
          Map<String, dynamic> data = {
            'amount': amount,
            'type': type,
            'category': notes,
          };
          ref.read(transactionProvider.notifier).createTransaction(ref, data);
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
