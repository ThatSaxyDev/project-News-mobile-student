import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_student/features/auth/screens/login_screen.dart';
import 'package:project_news_student/features/auth/services/auth_services.dart';
import 'package:project_news_student/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:project_news_student/features/home/screens/home_screen.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';
import 'package:project_news_student/shared/app_elements/app_images.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';
import 'package:project_news_student/shared/widgets/button.dart';
import 'package:project_news_student/shared/widgets/spacer.dart';
import 'package:project_news_student/shared/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedSchool = schools[0];
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices authServices = AuthServices();
  bool isPasswordInvisible = true;
  // bool isSignedIn = false;

  void signUpUser() {
    authServices.signUpUser(
      context: context,
      name: _nameController.text,
      email: _studentEmailController.text,
      password: _passwordController.text,
      school: selectedSchool,
      type: AppTexts.type,
    );
    Timer(const Duration(seconds: 5), () {
      authServices.signInUser(
        context: context,
        email: _studentEmailController.text,
        password: _passwordController.text,
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
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
              // AppColors.primaryBlue,
              AppColors.neutralWhite,
              AppColors.neutralWhite,
              AppColors.neutralWhite,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          ),
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spc(h: 110.h),

                // bu logo
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 90.h,
                    child: Image.asset(AppImages.schoolLogo),
                  ),
                ),
                Spc(h: 80.h),
                Text(
                  AppTexts.welcome,
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue),
                ),
                Spc(h: 5.h),
                Text(
                  AppTexts.welcomeMessage,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue),
                ),
                Spc(h: 20.h),

                //name input
                TextInputBox(
                  hintText: AppTexts.nameHintText,
                  height: 55.h,
                  controller: _nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppTexts.nameError;
                    }
                    return null;
                  },
                ),
                Spc(h: 15.h),

                // email input
                TextInputBox(
                  height: 55.h,
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
                      height: 55.h,
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
                Spc(h: 20.h),

                // select school
                SizedBox(
                  height: 48.h,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: DropdownButton(
                    onChanged: (String? newVal) {
                      setState(() {
                        selectedSchool = newVal!;
                      });
                    },
                    value: selectedSchool,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: schools.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 12.5.sp,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Spc(h: 40.h),

                // sign up button
                Button(
                  item:
                      // isLoggingIn
                      //     ? const CircularProgressIndicator()
                      //     :
                      Text(
                    AppTexts.signUpButtonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () async {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUpUser();
                      // setState(() {
                      //   isSignedIn = true;
                      // });

                    }
                  },
                ),

                //! to login screen
                Spc(h: 40.h),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: AppTexts.alreadyHaveAccountText,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppTexts.loginClickText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
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
