part of '../views.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    this.controller,
    this.hintText,
    this.onChange,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.contentPadding,
    this.inputFormatters,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChange;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomFont.blackFont12,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      onTap: widget.onTap,
      minLines: 1,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines ?? 1,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChange,
      controller: widget.controller,
      validator: widget.validator,
      textAlign: TextAlign.start,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.w),
        hintStyle: CustomFont.greyFont12,
        errorStyle: const TextStyle(height: 0),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColor.red,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColor.greyLight,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.red),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.theme),
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        suffixIconConstraints: const BoxConstraints(),
      ),
    );
  }
}
