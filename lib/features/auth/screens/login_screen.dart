import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/auth/screens/signup_screen.dart';
import 'package:project_news_student/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';
import 'package:project_news_student/shared/app_elements/app_images.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/button.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:project_news_student/shared/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _studentEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordInvisible = true;

  @override
  void dispose() {
    _studentEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void passwordVisibility() {
    setState(() {
      isPasswordInvisible = !isPasswordInvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height(context),
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
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
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spc(h: 70.h),

                // bu logo
                SizedBox(
                  height: 150.h,
                  child: Image.asset(AppImages.schoolLogo),
                ),
                Spc(h: 120.h),

                // welcome
                Text(
                  AppTexts.hey,
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue),
                ),
                Spc(h: 5.h),
                Text(
                  AppTexts.heyMessage,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralWhite),
                ),
                Spc(h: 20.h),

                // email input
                TextInputBox(
                  hintText: AppTexts.emailHintText,
                  controller: _studentEmailController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppTexts.emailError;
                    }
                    if (!val.toString().contains(AppTexts.emailValidator)) {
                      return AppTexts.emailErrorValidate;
                    }
                    return null;
                  },
                ),
                Spc(h: 15.h),

                // password input
                Stack(
                  children: [
                    TextInputBox(
                      hintText: AppTexts.passwordHintText,
                      controller: _passwordController,
                      obscuretext: isPasswordInvisible,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return AppTexts.passwordError;
                        }
                        return null;
                      },
                      suffixIcon: GestureDetector(
                        onTap: passwordVisibility,
                        child: Icon(
                          Icons.remove_red_eye,
                          color: isPasswordInvisible == true
                              ? AppColors.grey
                              : AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                Spc(h: 120.h),

                // login button
                Button(
                  title: AppTexts.loginButtonText,
                  onTap: () {
                    if (_loginFormKey.currentState!.validate()) {
                      // sign up user
                      Navigator.pushNamed(context, BottomNavBar.routeName);
                    }
                  },
                ),

                //! to sign up screen
                Spc(h: 40.h),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: AppTexts.dontHaveAccountText,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppTexts.signUpClickText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
