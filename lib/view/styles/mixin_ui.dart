part of '../views.dart';

mixin CustomMixin {
  BoxDecoration themeDecoration({Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: Colors.black.withOpacity(0.15),
        ),
      ],
    );
  }

  AppBar appBarReusable() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          debugPrint('test');
          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(
                Icons.chevron_left,
                color: CustomColor.grey,
              ),
              Flexible(
                child: Text(
                  'Kembali',
                  style: CustomFont.greyFont12,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 15) {
      return 'Selamat Siang';
    } else if (hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  showCustomPopUp({
    required BuildContext context,
    required String title,
    required Color color,
    int? time,
  }) {
    int timer = time ?? 3;
    Alert(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12),
      style: AlertStyle(
        descPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        buttonAreaPadding: EdgeInsets.zero,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.transparent),
        ),
        backgroundColor: color,
        animationType: AnimationType.fromBottom,
        alertAlignment: Alignment.bottomCenter,
        isCloseButton: false,
        alertElevation: 0,
        overlayColor: Colors.transparent,
      ),
      context: context,
      buttons: [],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomFont.whiteFont12,
          ),
          StreamBuilder(
            stream: Stream.periodic(
              const Duration(seconds: 1),
            ),
            builder: (context, snapshot) {
              timer--;
              if (timer == 0) {
                Navigator.of(context, rootNavigator: true).maybePop();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    ).show();
  }

  showLoaderOverlay({required BuildContext context}) {
    return showDialog(
      barrierDismissible: false,
      builder: (_) {
        return const PopScope(
          // canPop: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: CircularProgressIndicator(
                color: CustomColor.theme,
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }
}
