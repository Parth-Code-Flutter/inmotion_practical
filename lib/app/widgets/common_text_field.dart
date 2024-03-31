import 'package:flutter/material.dart';
import 'package:inmotion_practical/app/constants/color_const.dart';

Widget commonTextField({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  Widget? preFixIcon,
  Widget? suffixIcon,
  FocusNode? focusNode,
  TextInputType keyboardType = TextInputType.text,
  int maxLength = 50,
  double elevation = 0.0,
  int maxLines = 1,
  bool enabled = true,
  bool obscure = false,
  bool isShowElevation = true,
  bool readOnly = false,
  Color filledColor = kColorGreyTextFieldBG,
  Color borderColor = kTextFieldBorderColor,
  Color textColor = Colors.black,
  Function? validator,
  Function? onChanged,
  TextStyle? hintTextStyle,
  TextStyle? labelTextStyle,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    onChanged: (v) {
      if (onChanged != null) {
        onChanged(v);
      }
    },
    maxLength: maxLength,
    maxLines: maxLines,
    enabled: enabled,
    obscureText: obscure,
    readOnly: readOnly,
    // autofocus: true,
    focusNode: focusNode,
    validator: (v) => validator!(v),
    cursorColor: kColorPrimary,
    style: TextStyle(color: textColor),

    decoration: InputDecoration(
      fillColor: filledColor,
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: kHighlightTextColor, fontSize: 14),
      labelStyle: const TextStyle(color: kCountsColor, fontSize: 14),
      prefixIcon: preFixIcon,
      suffixIcon: suffixIcon,
      counterText: '',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
    ),
  );
}
