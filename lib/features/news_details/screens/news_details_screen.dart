// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/news_details/services/news_details_services.dart';
import 'package:project_news_student/models/news.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/utils/alert.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class NewsDetailsScreen extends StatefulWidget {
  static const String routeName = '/news-details';
  final News news;
  const NewsDetailsScreen({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final NewsServices newsServices = NewsServices();

  void addToBookmarks() {
    newsServices.addToBookmarks(
      context: context,
      news: widget.news,
    );
    showAlert(context, AppTexts.addedToBookmarks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppTexts.appName,
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 22.sp,
          ),
        ),
        actions: [
          IconButton(
              onPressed: addToBookmarks,
              icon: const Icon(
                Icons.bookmark_add_outlined,
                color: AppColors.primaryBlue,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.news.title,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spc(h: 8.h),
              Text(
                widget.news.date,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Spc(h: 20.h),
              Hero(
                tag: widget.news.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Image.network(widget.news.image),
                ),
              ),
              Spc(h: 30.h),
              Text(widget.news.content)
            ],
          ),
        ),
      ),
    );
  }
}
