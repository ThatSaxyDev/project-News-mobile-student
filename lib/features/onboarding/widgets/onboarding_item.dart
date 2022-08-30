import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 27.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 350.h,
            child: Image.asset(image),
          ),
          Spc(h: 20.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spc(h: 20.h),
          Text(
            description,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
