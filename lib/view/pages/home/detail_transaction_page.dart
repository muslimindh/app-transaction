part of '../../views.dart';

class DetailTransactionPage extends StatelessWidget with CustomMixin {
  const DetailTransactionPage({
    super.key,
    required this.id,
    this.amount,
    this.notes,
    this.date,
    this.type,
  });
  final int id;
  final String? type;
  final int? amount;
  final String? notes;
  final String? date;

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
            DeleteTransactionConsumer(id),
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
              if (type == "income") ...[
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
              ] else ...[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
                    decoration: BoxDecoration(
                      color: CustomColor.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Pengeluaran',
                      style: CustomFont.whiteFont10,
                    ),
                  ),
                ),
              ],
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
          Text(
            Utility.instance.moneyFormat.format(
              amount,
            ),
            style: CustomFont.blackFont12,
          ),
          const SizedBox(height: 8),
          const Text(
            'Keterangan',
            style: CustomFont.greyFont10,
          ),
          const SizedBox(height: 2),
          Text(
            notes ?? '-',
            style: CustomFont.blackFont12,
          ),
          const SizedBox(height: 8),
          const Text(
            'Tanggal',
            style: CustomFont.greyFont10,
          ),
          const SizedBox(height: 2),
          Text(
            '$date',
            style: CustomFont.blackFont12,
          ),
        ],
      ),
    );
  }
}
