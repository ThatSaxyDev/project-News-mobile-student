import 'package:flutter/material.dart';
import 'package:project_news_student/providers/user_provider.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      color: AppColors.neutralWhite,
      child: Center(child: Text(user.email)),
    );
  }
}
