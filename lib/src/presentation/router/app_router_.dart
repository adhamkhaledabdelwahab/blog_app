import 'package:blog_app/src/data/models/blog_post.dart';
import 'package:blog_app/src/presentation/router/app_router_names.dart';
import 'package:blog_app/src/presentation/screens/blog_post_screen.dart';
import 'package:blog_app/src/presentation/screens/home_screen.dart';
import 'package:blog_app/src/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;
    switch (name) {
      case AppRouterNames.rSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRouterNames.rHome:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppRouterNames.rBlogPost:
        final blogPost = args as BlogPost;
        return MaterialPageRoute(
          builder: (_) => BlogPostScreen(
            blogPost: blogPost,
          ),
        );
      default:
        return null;
    }
  }
}
