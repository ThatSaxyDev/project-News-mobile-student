import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/shimmer/widgets/shimmer_containers.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';

class HomeScreenShimmer extends StatefulWidget {
  const HomeScreenShimmer({super.key});

  @override
  State<HomeScreenShimmer> createState() => _HomeScreenShimmerState();
}

class _HomeScreenShimmerState extends State<HomeScreenShimmer> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     AppTexts.appName,
      //     style: TextStyle(
      //       color: AppColors.primaryBlue,
      //       fontSize: 22.sp,
      //     ),
      //   )
      //       .animate(onPlay: (controller) => controller.repeat())
      //       .shimmer(delay: 4000.ms, duration: 1800.ms) // shimmer +
      //       .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
      //       .scale(begin: 1.0, end: 1.1, duration: 600.ms) // scale up
      //       .then(delay: 600.ms) // then wait and
      //       .scale(begin: 1.0, end: 1 / 1.1),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.search,
      //         color: AppColors.primaryBlue,
      //       ),
      //     ),
      //   ],
      // ),
      // body: 
      return Padding(
        padding: EdgeInsets.only(left: 20.w, top: 9.h, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimnmerContainer(
              height: 45.h,
              width: 200.w,
            ),
            Spc(h: 23.h),
            Align(
              alignment: Alignment.center,
              child: ShimnmerContainer(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Spc(h: 45.h),
            ShimnmerContainer(
              height: 45.h,
              width: 200.w,
            ),
            Spc(h: 23.h),
            ShimnmerContainer(
              height: 100.h,
              width: double.infinity,
            ),
            Spc(h: 23.h),
            ShimnmerContainer(
              height: 100.h,
              width: double.infinity,
            ),
            Spc(h: 23.h),
            // ShimnmerContainer(
            //   height: 100.h,
            //   width: double.infinity,
            // ),
          ],
        ),
      ).animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: 1200.ms);
    // );
  }
}
