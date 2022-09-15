import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:project_news_student/features/auth/screens/login_screen.dart';
import 'package:project_news_student/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:project_news_student/features/onboarding/screens/onboarding_screen.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_images.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() {
    Timer(const Duration(milliseconds: 6500), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>
                Provider.of<UserProvider>(context).user.token.isNotEmpty
                    ? const BottomNavBar()
                    : const OnboardingScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(seconds: 5),
          builder: (context, value, _) {
            return LiquidLinearProgressIndicator(
              value: value,
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryBlue),
              backgroundColor: Colors.white,
              direction: Axis.vertical,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 150.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.neutralWhite,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(2, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(26.0),
                      image: DecorationImage(
                          image: AssetImage(AppImages.logo), fit: BoxFit.cover),
                    ),
                  )
                      .animate()
                      .shimmer(delay: 2000.ms, duration: 1800.ms) // shimmer +
                      .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
                      .scale(begin: 1.0, end: 1.1, duration: 600.ms) // scale up
                      .then(delay: 600.ms) // then wait and
                      .scale(begin: 1.0, end: 1 / 1.1), // scale down

                  //
                  Spc(h: 20.h),
                  Text(
                    '©kiishi.dart',
                    style: TextStyle(
                      color: AppColors.neutralWhite,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
