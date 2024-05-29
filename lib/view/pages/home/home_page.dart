part of '../../views.dart';

class HomePage extends StatelessWidget with CustomMixin {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetHeader(),
            widgetText(),
            const SizedBox(height: 2),
            const ListTransactionConsumer(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingButtonConsumer(),
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
                Text(
                  getGreeting(),
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
}
