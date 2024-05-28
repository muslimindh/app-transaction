part of '../../views.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage>
    with CustomMixin {
  String selectedItem = 'Pendapatan';
  List<String> itemTime = ['Pendapatan', 'Pengeluaran'];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarReusable(),
        body: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              CustomDropdownField(
                hint: 'Pilih Transaksi',
                value: selectedItem,
                items: itemTime,
                onChange: (String? newValue) {
                  setState(() {
                    selectedItem = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomFormField(
                hintText: 'Jumlah Pendapatan/Pengeluaran',
                keyboardType: TextInputType.number,
                controller: amountController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Masukkan hanya angka tanpa koma atau titik';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomFormField(
                hintText: 'Keterangan',
                maxLines: 3,
                controller: notesController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              AddTransactionConsumer(
                formkey: formKey,
                amount: amountController,
                type: selectedItem,
                notes: notesController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
