// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_student/shared/app_elements/app_colors.dart';

class TextInputBox extends StatelessWidget {
  final double? height;
  final double? width;
  final String hintText;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  const TextInputBox({
    Key? key,
    this.height,
    this.width,
    required this.hintText,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          helperText: " ",
          helperStyle: const TextStyle(fontSize: 0.0005),
          errorStyle: const TextStyle(fontSize: 0.0005),
          // isDense: true,

          suffixIcon: suffixIcon,
          // labelText: hintText,
          // labelStyle: TextStyle(
          //   fontSize: 16.sp,
          //   fontWeight: FontWeight.w400,
          //   color: AppColors.primaryBlue,
          // ),
          hintText: hintText,
          fillColor: const Color.fromRGBO(245, 245, 245, 1),
          filled: true,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(125, 127, 129, 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
