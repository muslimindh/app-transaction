part of '../../views.dart';

class HomePage extends ConsumerWidget with CustomMixin {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsyncValue = ref.watch(listDatatransactionProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetHeader(),
            widgetText(),
            const SizedBox(height: 2),
            widgetTransaction(transactionAsyncValue),
          ],
        ),
      ),
    );
  }

  Widget widgetHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello,',
                  style: CustomFont.blackFont12,
                ),
                SizedBox(height: 2.h),
                const Text(
                  'Selamat siang',
                  style: CustomFont.greyFont12,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Text(
        'Histori Pendapatan/Pengeluaran',
        style: CustomFont.blackFont12,
      ),
    );
  }

  Widget widgetTransaction(
    AsyncValue<List<DataTransaction>> transactionAsyncValue,
  ) {
    return transactionAsyncValue.when(
      data: (transactions) {
        if (transactions.isNotEmpty) {
          return Expanded(
            child: widgetListCard(transactions),
          );
        } else {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text('no data'),
            ),
          );
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err'),
    );
  }

  Widget widgetListCard(List<DataTransaction> transactions) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => const DetailTransactionPage());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
            decoration: themeDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].parseDate(),
                        style: CustomFont.greyFont10,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        Utility.instance.moneyFormat.format(
                          transactions[index].amount!,
                        ),
                        style: CustomFont.blackFont12,
                      ),
                    ],
                  ),
                ),
                if (transactions[index].type == "income") ...[
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
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
              ],
            ),
          ),
        );
      },
      itemCount: transactions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
