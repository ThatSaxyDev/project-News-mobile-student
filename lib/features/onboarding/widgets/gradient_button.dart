import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GradientButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 312.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
          // gradient: const LinearGradient(
          //   colors: [
          //     AppColors.blue02,
          //     AppColors.primaryBlue,
          //   ],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          color: AppColors.primaryBlue,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Spc(w: 17.5.w),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 12.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
