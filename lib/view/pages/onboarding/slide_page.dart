part of '../../views.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  final String imgPath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/$imgPath'),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(title, style: CustomFont.blackFont18Semi),
          const SizedBox(height: 12),
          Text(
            subTitle,
            style: CustomFont.blackLightFont14,
          ),
        ],
      ),
    );
  }
}
