import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen(this.data, {Key? key}) : super(key: key);
  final NewsData data;
  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title!,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
             Spc(h: 8.h),
              Text(
                widget.data.date!,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Spc(h: 20.h),
              Hero(
                tag: "${widget.data.title}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Image.network(widget.data.urlToImage!),
                ),
              ),
              Spc(h: 30.h),
              Text(widget.data.content!)
            ],
          ),
        ),
      ),
    );
  }
}
