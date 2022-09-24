import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen2.dart';
import 'package:project_news_student/features/search/services/search_services.dart';
import 'package:project_news_student/features/search/widgets/searched_news.dart';
import 'package:project_news_student/models/news.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/widgets/loader.dart';
import 'package:project_news_student/shared/widgets/search_bar.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<News>? news;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    super.initState();
    fetchSearchedNews();
  }

  fetchSearchedNews() async {
    news = await searchServices.fetchSearchedNews(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: query,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryBlue,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              // gradient: GlobalVariables.appBarGradient,
              color: Colors.transparent,
            ),
          ),
          title: const SearchBar(),
        ),
      ),
      body: news == null
          ? const Loader()
          : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
                children: [
                  Spc(h: 10.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: news!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              NewsDetailsScreen2.routeName,
                              arguments: news![index],
                            );
                          },
                          child: SearchedNews(
                            news: news![index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
