import 'package:flutter/material.dart';
import 'package:project_news_student/features/auth/services/auth_services.dart';
import 'package:project_news_student/shared/widgets/button.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  void signOutUser(BuildContext context) {
    AuthServices().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Button(
          onTap: () {
            signOutUser(context);
          },
          item: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
