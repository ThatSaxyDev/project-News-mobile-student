import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: AppTexts.appName,
          theme: ThemeData(
            primaryColor: AppColors.primaryBlue,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Container(),
    );
  }
}
