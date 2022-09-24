import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/widgets/search_bar.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories-screen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.primaryBlue,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          title: const SearchBar(),
        ),
      ),
      
    );
  }
}
