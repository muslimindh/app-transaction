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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarReusable(),
        body: ListView(
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
              validator: (value) {},
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Keterangan',
              maxLines: 3,
              validator: (value) {},
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () {},
              child: const Center(
                child: Text(
                  'Tambah Transaksi',
                  style: CustomFont.whiteFont12Semi,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
