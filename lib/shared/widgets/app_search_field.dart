import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/utils/app_assets.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

Widget appSearchField({
  required BuildContext context,
  double width = double.infinity,
  bool readOnly = false,
  TextStyle? textStyle,
  TextStyle? hintTextStyle,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextInputType? textInputType,
  TextEditingController? textEditingController,
  String? hintText,
  String? initialValue,
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
  List<TextInputFormatter>? inputFormatters,
  Function(String)? onChanged,
  Function(String)? onFieldSubmitted,
  Function(String?)? onSaved,
  VoidCallback? onTap,
  String? Function(String?)? validator,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.r),
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: AppColor.black.withValues(alpha: 0.1),
          offset: Offset(1, 1),
          blurRadius: 10,
          spreadRadius: 0,
        ),
      ],
    ),
    child: TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      style: textStyle ?? AppStyle.textTextStyle,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: textInputType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      focusNode: focusNode,
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      cursorColor: cursoreColor,
      onTap: onTap,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppStyle.searchHintTextStyle,
        fillColor: AppColor.white,
        filled: true,
        prefixIcon:
            prefixIcon ??
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: SvgPicture.asset(
                AppAssets.icSearchfield,
                height: 24.h,
                width: 24.w,
              ),
            ),
        suffixIcon: suffixIcon,
        prefix: prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffix: suffix,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide(color: AppColor.neutralColor08, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide(color: AppColor.neutralColor08, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide(color: AppColor.neutralColor08, width: 1.w),
        ),
      ),
    ),
  );
}
