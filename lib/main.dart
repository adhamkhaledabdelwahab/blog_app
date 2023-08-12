import 'dart:async';
import 'dart:developer';

import 'package:blog_app/src/bussiness_logic/bloc_observer.dart';
import 'package:blog_app/src/bussiness_logic/blog_post_cubit/blog_post_cubit.dart';
import 'package:blog_app/src/bussiness_logic/category_cubit/category_cubit.dart';
import 'package:blog_app/src/core/services/dio_service.dart';
import 'package:blog_app/src/presentation/router/app_router_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      DioService.init();
      Bloc.observer = BlogAppBlocObserver();
      runApp(const MyApp());
    },
    (error, stack) {
      log("Global Error: $error", name: "Global Error");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BlogPostCubit(),
        ),
        BlocProvider(
          create: (_) => CategoryCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ThemeData(primarySwatch: Colors.orange),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
