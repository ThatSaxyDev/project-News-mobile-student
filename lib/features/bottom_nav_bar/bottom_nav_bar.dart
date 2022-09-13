import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_news_student/features/home/screens/home_screen.dart';
import 'package:project_news_student/features/home/screens/profile_logout.dart';
import 'package:project_news_student/features/profile/screens/profile_screen.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/nav-bar';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  List<IconData> iconData = [
    Icons.home_outlined,
    Icons.favorite,
    Icons.person_outline_sharp
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Favorite')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: AppColors.blue02,
        child: SizedBox(
          height: 95.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: iconData
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        setState(() {
                          _page = iconData.indexOf(item);
                        });
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        duration: const Duration(milliseconds: 250),
                        width: 35,
                        decoration: BoxDecoration(
                          border: _page == iconData.indexOf(item)
                              ? Border(
                                  top: BorderSide(
                                    width: 3.w,
                                    color: Colors.white,
                                  ),
                                )
                              : null,
                          gradient: _page == iconData.indexOf(item)
                              ? const LinearGradient(
                                  colors: [
                                    AppColors.neutralWhite,
                                    AppColors.blue02,
                                    AppColors.blue02,
                                    AppColors.blue02,
                                    AppColors.blue02,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                              : null,
                        ),
                        child: Icon(
                          item,
                          size: 35.w,
                          color: _page == iconData.indexOf(item)
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
