// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen2.dart';
import 'package:project_news_student/features/news_details/services/news_details_services.dart';
import 'package:project_news_student/models/news.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/utils/alert.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:provider/provider.dart';

class BookmarksNewsListTile extends StatelessWidget {
  final int index;

  const BookmarksNewsListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsServices newsServices = NewsServices();
    final bookmarks = context.watch<UserProvider>().user.bookmarks[index];
    final news = News.fromMap(bookmarks['news']);

    return FocusedMenuHolder(
      onPressed: () {},
      menuWidth: MediaQuery.of(context).size.width * 0.5,
      duration: const Duration(milliseconds: 500),
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
          title: const Text(AppTexts.open),
          trailingIcon: const Icon(Icons.open_in_new),
          onPressed: () {
            Navigator.pushNamed(
              context,
              NewsDetailsScreen.routeName,
              arguments: news,
            );
          },
        ),
        FocusedMenuItem(
          title: const Text(AppTexts.removeFromBookmarks),
          trailingIcon: const Icon(Icons.bookmark_add),
          onPressed: () {
            newsServices.removeFromBookmarks(
              context: context,
              news: news,
            );
            showAlert(context, AppTexts.removedFromBookmarks);
          },
        ),
        FocusedMenuItem(
          title: const Text(AppTexts.share),
          trailingIcon: const Icon(Icons.share),
          onPressed: () {},
        ),
      ],
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            NewsDetailsScreen.routeName,
            arguments: news,
          );
        },
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
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: NetworkImage(news.image),
                      fit: BoxFit.fitHeight,
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
                      news.title,
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
                      news.content,
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
      ),
    );
  }
}
