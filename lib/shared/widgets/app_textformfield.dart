import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

import '../utils/app_style.dart';

Widget appTextFormField({
  required BuildContext context,
  bool? autoFocus,
  bool obscureText = false,
  bool readOnly = false,
  bool? filled,
  TextStyle? textStyle,
  TextStyle? headerStyle,
  TextStyle? hintTextStyle,
  TextStyle? errorStyle,
  TextStyle? prefixTextStyle,
  TextStyle? suffixTextStyle,
  TextStyle? counterTextStyle,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextInputType? textInputType,
  TextEditingController? textEditingController,
  InputBorder? errorBorder,
  InputBorder? focusedErrorBorder,
  InputBorder? enableBorder,
  InputBorder? focusedBorder,
  String? hintText,
  String headerText = '',
  String? errorText,
  String? prefixText,
  String? suffixText,
  String? initialValue,
  String? counterText,
  EdgeInsetsGeometry? paddingVertical,
  EdgeInsetsGeometry? paddingHorizontal,
  Color? fillColor,
  Color cursoreColor = AppColor.neutralColor04,
  int? maxLength,
  int? minLines,
  int maxLines = 1,
  TextAlign? textAlign,
  FocusNode? focusNode,
  Widget? prefix,
  Widget? suffix,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? counterWidget,
  List<TextInputFormatter>? inputFormatters,
  Function(String)? onChanged,
  Function(String)? onFieldSubmitted,
  Function(String?)? onSaved,
  VoidCallback? onTap,
  Function(PointerDownEvent)? onTapOutside,
  String? Function(String?)? validator,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (headerText != '')
        Text(
          headerText.toString(),
          style: headerStyle ?? AppStyle.headerTextStyle,
        ),
      if (headerText != '') SizedBox(height: 8.h),
      TextFormField(
        autofocus: autoFocus ?? false,
        controller: textEditingController,
        obscureText: obscureText,
        readOnly: readOnly,
        style: textStyle ?? AppStyle.textTextStyle,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: textInputType,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        onTapOutside:
            onTapOutside ??
            (event) {
              FocusScope.of(context).unfocus();
            },
        onSaved: onSaved,
        validator: validator,
        initialValue: initialValue,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        cursorColor: cursoreColor,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          filled: filled ?? true,
          fillColor: fillColor ?? AppColor.neutralColor08,
          hintStyle: hintTextStyle ?? AppStyle.hintTextStyle,
          errorStyle: errorStyle,
          prefixText: prefixText,
          suffixText: suffixText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffix: suffix,
          counter: counterWidget,
          counterStyle: counterTextStyle,
          prefixStyle: prefixTextStyle,
          suffixStyle: suffixTextStyle,

          contentPadding: EdgeInsets.symmetric(
            vertical: paddingVertical?.vertical ?? 8.h,
            horizontal: paddingHorizontal?.horizontal ?? 14.w,
          ),
          enabledBorder:
              enableBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none,
              ),
          focusedBorder:
              focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none,
              ),
          errorBorder:
              errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(color: AppColor.red),
              ),
          focusedErrorBorder:
              focusedErrorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(color: AppColor.red),
              ),
        ),
      ),
    ],
  );
}
