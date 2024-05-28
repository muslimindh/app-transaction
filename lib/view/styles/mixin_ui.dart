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
}
