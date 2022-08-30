import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/onboarding/widgets/gradient_button.dart';
import 'package:project_news_student/features/onboarding/widgets/onboarding_item.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_images.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.blue02,
              AppColors.neutralWhite,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 30.w,
                  top: 35.h,
                ),
                child: TextButton(
                  onPressed: () {
                    // navigate to sign up
                  },
                  child: Text(
                    AppTexts.skip,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                ),
              ),
            ),
            Spc(h: 50.h),

            //! onboarding image, title, description
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  OnboardingItem(
                    image: AppImages.onboardingImage1,
                    title: AppTexts.title1,
                    description: AppTexts.description1,
                  ),
                  OnboardingItem(
                    image: AppImages.onboardingImage2,
                    title: AppTexts.title2,
                    description: AppTexts.description2,
                  ),
                  OnboardingItem(
                    image: AppImages.onboardingImage3,
                    title: AppTexts.title3,
                    description: AppTexts.description3,
                  ),
                ],
              ),
            ),
            Spc(h: 10.h),

            // page indicator
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 5.h,
                activeDotColor: AppColors.primaryBlue,
              ),
            ),
            Spc(h: 50.h),

            //! button
            GradientButton(
              title: page == 0
                  ? AppTexts.buttonNext
                  : page == 1
                      ? AppTexts.buttonNext
                      : AppTexts.buttonGettingStarted,
              onTap: () {
                if (_controller.page!.toInt() != 2) {
                  setState(() {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                    page++;
                  });
                } else {
                  // navigate to sign up
                }
              },
            ),
            Spc(h: 50.h),
          ],
        ),
      ),
    );
  }
}
