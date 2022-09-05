// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_student/shared/app_elements/app_colors.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final Widget item;
  const Button({
    Key? key,
    required this.onTap,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        // width: 312.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6.r),
            ),
            color: AppColors.primaryBlue),
        child: Center(
          child: item
          // Text(
          //   title,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 16.sp,
          //   ),
          // ),
        ),
      ),
    );
  }
}
