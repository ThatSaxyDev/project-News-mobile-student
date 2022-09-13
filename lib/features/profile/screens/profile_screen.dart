import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/auth/services/auth_services.dart';
import 'package:project_news_student/features/home/services/news_model.dart';
import 'package:project_news_student/features/home/widgets/news_list_tile.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_images.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logOut(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  AuthServices().signOut(context);
                },
                child: const Text(
                  'Yes',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'No',
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppTexts.profileHeader,
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 22.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => logOut(context),
            icon: const Icon(
              Icons.logout,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: const AssetImage(AppImages.blankProfilePic),
                ),
              ),
              Spc(h: 30.h),
              Text(
                user.name,
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
              ),
              Spc(h: 10.h),
              Text(
                user.email,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
      
              //
              Spc(h: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppTexts.bookmarks,
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
                  children:
                      NewsData.recentNewsData.map((e) => NewsListTile(e)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
