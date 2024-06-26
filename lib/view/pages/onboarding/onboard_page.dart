part of '../../views.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int _currentPages = 0;
  final PageController _controller = PageController();
  List<Widget> pages = [
    const SlidePage(
      imgPath: 'income.png',
      title: 'Lacak Pendapatan',
      subTitle:
          'Aplikasi ini memungkinkan pengguna untuk menambahkan dan melacak catatan pendapatan dengan mudah dan efisien',
    ),
    const SlidePage(
      imgPath: 'expense.png',
      title: 'Lacak Pengeluaran',
      subTitle:
          'Aplikasi ini memungkinkan pengguna untuk menambahkan dan melacak catatan pengeluaran dengan mudah dan efisien',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: PageView.builder(
                      itemBuilder: (context, int index) => pages[index],
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPages = index;
                        });
                      },
                      itemCount: 2,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(flex: 14),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(2, (int index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                height: 10,
                                width: 10,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPages)
                                      ? CustomColor.theme
                                      : CustomColor.grey,
                                ),
                              );
                            }),
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              if (_currentPages == (2 - 1)) {
                                Get.offAll(() => const HomePage());
                              } else {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOutQuint,
                                );
                              }
                            },
                            child: const Center(
                              child: Text(
                                'Lanjutkan',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
