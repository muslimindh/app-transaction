part of '../../views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CustomMixin {
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
            Expanded(
              child: widgetListCard(),
            ),
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

  Widget widgetListCard() {
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '01 Nov 2024 - 19.00',
                        style: CustomFont.greyFont10,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Rp. 20.000',
                        style: CustomFont.blackFont12,
                      ),
                    ],
                  ),
                ),
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
              ],
            ),
          ),
        );
      },
      itemCount: 20,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
