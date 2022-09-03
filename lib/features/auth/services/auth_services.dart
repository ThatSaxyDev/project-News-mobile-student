import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_news_student/features/auth/screens/login_screen.dart';
import 'package:project_news_student/models/user.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';
import 'package:project_news_student/shared/utils/alert.dart';
import 'package:project_news_student/shared/utils/error_handling.dart';

class AuthServices {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String school,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        school: school,
        password: password,
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showAlert(
            context,
            'Account Created, proceed to login',
          );
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.pushNamed(
                context,
                LoginScreen.routeName,
              );
            },
          );
        },
      );
    } catch (e) {
      showAlert(
        context,
        e.toString(),
      );
    }
  }
}
