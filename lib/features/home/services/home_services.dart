import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_news_student/models/news.dart';
import 'package:http/http.dart' as http;
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';
import 'package:project_news_student/shared/utils/alert.dart';
import 'package:project_news_student/shared/utils/error_handling.dart';
import 'package:provider/provider.dart';

class HomeServices {
  // get all news
  Future<List<News>> fetchAllNews(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<News> newsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/news'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            newsList.add(
              News.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showAlert(context, e.toString());
    }
    return newsList;
  }
}
