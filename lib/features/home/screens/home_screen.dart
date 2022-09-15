import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:project_news_student/features/home/services/home_services.dart';
import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/home/widgets/breaking_news_card.dart';
import 'package:project_news_student/features/home/widgets/menu.dart';
import 'package:project_news_student/features/home/widgets/news_list_tile.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen2.dart';
import 'package:project_news_student/features/shimmer/screens/home_screen_shimmer.dart';
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
  late List<News> newsList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchAllNews();
  }

  Future<List<News>> fetchAllNews() async {
    newsList = await homeServices.fetchAllNews(context);
    return newsList;
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
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(delay: 4000.ms, duration: 1800.ms) // shimmer +
            .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
            .scale(begin: 1.0, end: 1.1, duration: 600.ms) // scale up
            .then(delay: 600.ms) // then wait and
            .scale(begin: 1.0, end: 1 / 1.1),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.primaryBlue,
              ))
        ],
      ),
      body: FutureBuilder(
        future: fetchAllNews(),
        builder: (context, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
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
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spc(h: 20.h),
                    // newsList == null
                    //     ? const Loader()
                    //     :
                    CarouselSlider.builder(
                        itemCount: newsList.length,
                        itemBuilder: (context, index, id) {
                          final news = newsList[index];
                          return FocusedMenuHolder(
                            onPressed: () {},
                            menuWidth: MediaQuery.of(context).size.width * 0.5,
                            duration: const Duration(milliseconds: 500),
                            menuItems: <FocusedMenuItem>[
                              FocusedMenuItem(
                                title: Text('Open'),
                                trailingIcon: Icon(Icons.open_in_new),
                                onPressed: () {},
                              ),
                              FocusedMenuItem(
                                title: Text('Add to bookmarks'),
                                trailingIcon: Icon(Icons.bookmark_add),
                                onPressed: () {},
                              ),
                              FocusedMenuItem(
                                title: Text('Share'),
                                trailingIcon: Icon(Icons.share),
                                onPressed: () {},
                              ),
                            ],
                            child: BreakingNewsCard(
                              title: news.title,
                              author: news.author,
                              image: news.image,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NewsDetailsScreen2.routeName,
                                  arguments: news,
                                );
                              },
                            )
                                .animate(
                                    onPlay: (controller) => controller.repeat())
                                .scale(
                                    begin: 1.0,
                                    end: 1 / 1.005,
                                    duration: 600.ms) // scale up
                                .then(delay: 1.ms) // then wait and
                                .scale(begin: 1.0, end: 1.005),
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
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spc(h: 14.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: newsList
                            .map(
                              (e) => FocusedMenuHolder(
                                onPressed: () {},
                                menuWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                                duration: const Duration(milliseconds: 500),
                                menuItems: <FocusedMenuItem>[
                                  FocusedMenuItem(
                                    title: Text('Open'),
                                    trailingIcon: Icon(Icons.open_in_new),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        NewsDetailsScreen.routeName,
                                        arguments: e,
                                      );
                                    },
                                  ),
                                  FocusedMenuItem(
                                    title: Text('Add to bookmarks'),
                                    trailingIcon: Icon(Icons.bookmark_add),
                                    onPressed: () {},
                                  ),
                                  FocusedMenuItem(
                                    title: Text('Share'),
                                    trailingIcon: Icon(Icons.share),
                                    onPressed: () {},
                                  ),
                                ],
                                child: NewsListTile(
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
                                  // onLongPress: () {},
                                )
                                    .animate(
                                        onPlay: (controller) =>
                                            controller.repeat())
                                    .scale(
                                        begin: 1.0,
                                        end: 1 / 1.005,
                                        duration: 600.ms) // scale up
                                    .then(delay: 1.ms) // then wait and
                                    .scale(begin: 1.0, end: 1.005),
                              ),
                            )
                            .toList()
                            .animate(interval: 565.ms)
                            .fadeIn(duration: 700.ms)
                            .shimmer(delay: 800.ms, duration: 2000.ms),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return const HomeScreenShimmer();
        },
      ),
    );
  }
}
