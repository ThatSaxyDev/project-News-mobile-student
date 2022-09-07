import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_news_student/features/home/screens/home_screen.dart';
import 'package:project_news_student/features/home/screens/profile_logout.dart';
import 'package:project_news_student/features/profile/screens/profile_screen.dart';
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
    const ProfileScreen(),
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.blue02,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          padding: EdgeInsets.only(
            left: 17.w, right: 17.w, bottom: 10.h,
            // vertical: 17.w,
          ),
          child: GNav(
            onTabChange: updatePage,
            backgroundColor: AppColors.blue02,
            color: AppColors.neutralWhite,
            activeColor: AppColors.primaryBlue,
            gap: 10.w,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),

        //  CurvedNavigationBar(
        //   height: 75.h,
        //   backgroundColor: Colors.transparent,
        //   color: AppColors.blue02,
        //   buttonBackgroundColor: AppColors.blue02,
        //   animationCurve: Curves.easeInOut,
        //   animationDuration: const Duration(milliseconds: 400),
        //   onTap: updatePage,
        //   items: const [
        //     Icon(
        //       Icons.home,
        //       color: AppColors.neutralWhite,
        //     ),
        //     Icon(
        //       Icons.favorite,
        //       color: AppColors.neutralWhite,
        //     ),
        //     Icon(
        //       Icons.person,
        //       color: AppColors.neutralWhite,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
