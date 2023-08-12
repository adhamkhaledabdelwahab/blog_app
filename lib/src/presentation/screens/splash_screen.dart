import 'package:blog_app/src/core/constants/app_assets.dart';
import 'package:blog_app/src/core/constants/app_strings.dart';
import 'package:blog_app/src/presentation/router/app_router_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacementNamed(
        context,
        AppRouterNames.rHome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent.withOpacity(0.3),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imageLogo,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.strBlogApp,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
