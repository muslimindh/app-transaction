part of '../../views.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: CustomFont.blackFont18Semi),
          SizedBox(height: 12.h),
          Text(
            subTitle,
            style: CustomFont.blackLightFont14,
          ),
        ],
      ),
    );
  }
}
