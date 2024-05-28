part of '../views.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.borderSide,
    this.padding,
    required this.onTap,
    required this.child,
  });

  final Color? backgroundColor;
  final BorderSide? borderSide;
  final VoidCallback onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? CustomColor.theme,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
        elevation: 0,
        shadowColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
