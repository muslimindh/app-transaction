part of '../../views.dart';

class DetailTransactionPage extends StatelessWidget with CustomMixin {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarReusable(),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4),
          children: [
            widgetCard(),
            const SizedBox(height: 10),
            widgetButton(),
          ],
        ),
      ),
    );
  }

  Widget widgetCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
      decoration: themeDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
                  decoration: BoxDecoration(
                    color: CustomColor.theme,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Pendapatan',
                    style: CustomFont.whiteFont10,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  '2 jam yang lalu',
                  textAlign: TextAlign.end,
                  style: CustomFont.greyFont10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Jumlah',
            style: CustomFont.greyFont10,
          ),
          const SizedBox(height: 2),
          const Text(
            'Rp. 10.000',
            style: CustomFont.blackFont12,
          ),
          const SizedBox(height: 8),
          const Text(
            'Keterangan',
            style: CustomFont.greyFont10,
          ),
          const SizedBox(height: 2),
          const Text(
            'Uang Makan',
            style: CustomFont.blackFont12,
          ),
          const SizedBox(height: 8),
          const Text(
            'Tanggal',
            style: CustomFont.greyFont10,
          ),
          const SizedBox(height: 2),
          const Text(
            '01 November 2024',
            style: CustomFont.blackFont12,
          ),
        ],
      ),
    );
  }

  Widget widgetButton() {
    return Column(
      children: [
        CustomButton(
          backgroundColor: Colors.white,
          borderSide: const BorderSide(
            color: CustomColor.warning,
          ),
          onTap: () {},
          child: const Center(
            child: Text(
              'Edit Transaksi',
              style: CustomFont.yellowFont12Semi,
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          backgroundColor: CustomColor.red.withOpacity(0.8),
          onTap: () {},
          child: const Center(
            child: Text(
              'Hapus Transaksi',
              style: CustomFont.whiteFont12Semi,
            ),
          ),
        ),
      ],
    );
  }
}
