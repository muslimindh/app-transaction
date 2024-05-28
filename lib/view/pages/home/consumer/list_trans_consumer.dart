part of '../../../views.dart';

class ListTransactionConsumer extends ConsumerWidget with CustomMixin {
  const ListTransactionConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsyncValue = ref.watch(listDatatransactionProvider);
    return widgetTransaction(transactionAsyncValue);
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
            child: Container(),
          );
        }
      },
      loading: () => Expanded(
        child: widgetLoading(),
      ),
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
            Get.to(
              () => DetailTransactionPage(
                id: transactions[index].id!,
                amount: transactions[index].amount ?? 0,
                date: transactions[index].parseDate(),
                notes: transactions[index].category,
                type: transactions[index].type,
              ),
            );
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

  Widget widgetLoading() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
          decoration: themeDecoration(),
          child: const ShimmerLoading(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 20),
                      SizedBox(height: 2),
                      Skelton(height: 20),
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  child: Skelton(height: 26),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
