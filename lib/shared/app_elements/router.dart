import 'package:flutter/material.dart';
import 'package:project_news_student/features/auth/screens/login_screen.dart';
import 'package:project_news_student/features/auth/screens/signup_screen.dart';
import 'package:project_news_student/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:project_news_student/features/home/screens/home_screen.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen.dart';
import 'package:project_news_student/features/news_details/screens/news_details_screen2.dart';
import 'package:project_news_student/features/onboarding/screens/onboarding_screen.dart';
import 'package:project_news_student/features/search/screen/search_screen.dart';
import 'package:project_news_student/models/news.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case BottomNavBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomNavBar(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case NewsDetailsScreen.routeName:
      var news = routeSettings.arguments as News;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NewsDetailsScreen(
          news: news,
        ),
      );
    case NewsDetailsScreen2.routeName:
      var news = routeSettings.arguments as News;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NewsDetailsScreen2(
          news: news,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
