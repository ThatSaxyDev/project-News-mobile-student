import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/home/services/home_services.dart';
import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/home/widgets/breaking_news_card.dart';
import 'package:project_news_student/features/home/widgets/news_list_tile.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/models/news.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/loader.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News>? newsList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchAllNews();
  }

  fetchAllNews() async {
    newsList = await homeServices.fetchAllNews(context);
    setState(() {});
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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.primaryBlue,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                AppTexts.firstHeader,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spc(h: 20.h),
            newsList == null
                ? const Loader()
                : CarouselSlider.builder(
                    itemCount: newsList!.length,
                    itemBuilder: (context, index, id) {
                      final news = newsList![index];
                      return BreakingNewsCard(
                        title: news.title,
                        author: news.author,
                        image: news.image,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsDetailsScreen.routeName,
                            arguments: news,
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    )),
            Spc(h: 35.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                AppTexts.secondHeader,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spc(h: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: newsList!
                    .map(
                      (e) => NewsListTile(
                        image: e.image,
                        title: e.title,
                        content: e.content,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsDetailsScreen.routeName,
                            arguments: e,
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
