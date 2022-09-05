import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/home/screens/home_screen.dart';
import 'package:project_news_student/features/home/screens/profile_logout.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/nav-bar';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Favorite')),
    const Logout(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: AppColors.blue02,
        body: pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          height: 75.h,
          backgroundColor: AppColors.neutralWhite,
          color: AppColors.blue02,
          buttonBackgroundColor: AppColors.blue02,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: updatePage,
          items: const [
            Icon(
              Icons.home,
              color: AppColors.neutralWhite,
            ),
            Icon(
              Icons.favorite,
              color: AppColors.neutralWhite,
            ),
            Icon(
              Icons.person,
              color: AppColors.neutralWhite,
            ),
          ],
        ),
      ),
    );
  }
}
