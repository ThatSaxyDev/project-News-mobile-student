// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class NewsListTile extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final void Function()? onTap;
  const NewsListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.all(12.w),
        height: 130.h,
        decoration: BoxDecoration(
          color: AppColors.neutralWhite,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Hero(
                tag: title,
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Spc(w: 10.w),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spc(h: 8.h),
                  Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
