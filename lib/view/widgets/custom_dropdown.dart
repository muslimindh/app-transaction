part of '../views.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField(
      {super.key,
      required this.value,
      required this.items,
      required this.onChange,
      required this.hint,
      this.validator,
      this.hintStyle,
      this.iconColor});

  final String? value;
  final String hint;
  final List<String> items;
  final Function(String?) onChange;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: CustomFont.blackFont12,
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down, color: CustomColor.theme),
      iconSize: 20,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: CustomColor.greyLight),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: CustomColor.theme),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: CustomColor.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: CustomColor.red),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.w),
        hintStyle: CustomFont.greyFont12,
        hintText: hint,
      ),
      onChanged: onChange,
      items: items
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
          .toList(),
    );
  }
}


// class CustomDropdownField extends StatelessWidget {
//   const CustomDropdownField({
//     super.key,
//     required this.value,
//     required this.items,
//     required this.onChange,
//   });

//   final String? value;
//   final List<String> items;
//   final Function(String?)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       elevation: 0,
//       value: value,
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
//       underline: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: CustomColor.greyLight),
//         ),
//       ),
//       icon: const Icon(Icons.keyboard_arrow_down, color: CustomColor.theme),
//       iconSize: 24,
//       isExpanded: true,
//       style: CustomFont.blackFont12,
//       onChanged: onChange,
//       isDense: true,
//       items: items
//           .map<DropdownMenuItem<String>>(
//               (String value) => DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   ))
//           .toList(),
//     );
//   }
// }
