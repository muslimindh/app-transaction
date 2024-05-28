part of '../views.dart';

class Skelton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final bool isCircle;
  final EdgeInsetsGeometry? margin;

  const Skelton({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.isCircle = false,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return isCircle
        ? CircleAvatar(backgroundColor: Colors.white, radius: radius ?? 6)
        : Container(
            height: height ?? 16,
            width: width ?? double.infinity,
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius ?? 6),
            ),
          );
  }
}
