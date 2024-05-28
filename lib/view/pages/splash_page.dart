part of '../views.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenDialog = (prefs.getBool('seen') ?? false);

    if (seenDialog) {
      Timer(const Duration(seconds: 4), () {
        Get.off(() => const AddTransactionPage());
      });
    } else {
      await prefs.setBool('seen', true);
      Timer(const Duration(seconds: 4), () {
        Get.off(() => const OnBoardPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: const Center(
          child: FlutterLogo(
            size: 128,
            style: FlutterLogoStyle.horizontal,
          ),
        ),
      ),
    );
  }
}
