import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_news_student/models/news.dart';
import 'package:project_news_student/models/user.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_constants.dart';
import 'package:project_news_student/shared/utils/alert.dart';
import 'package:project_news_student/shared/utils/error_handling.dart';
import 'package:provider/provider.dart';

class NewsServices {
  // add news to bookmarks
  void addToBookmarks({
    required BuildContext context,
    required News news,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/add-to-bookmarks'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': news.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            bookmarks: jsonDecode(res.body)['bookmarks'],
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showAlert(context, e.toString());
    }
  }
}
