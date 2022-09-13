// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class BreakingNewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
   final void Function()? onTap;
  const BreakingNewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spc(h: 8.h),
              Text(
                author,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
