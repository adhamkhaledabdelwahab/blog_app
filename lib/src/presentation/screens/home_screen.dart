import 'package:blog_app/src/bussiness_logic/blog_post_cubit/blog_post_cubit.dart';
import 'package:blog_app/src/bussiness_logic/category_cubit/category_cubit.dart';
import 'package:blog_app/src/core/constants/app_strings.dart';
import 'package:blog_app/src/presentation/views/home_blog_posts_view.dart';
import 'package:blog_app/src/presentation/views/home_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlogPostCubit.get(context).fetchAllBlogPosts();
    CategoryCubit.get(context).fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          AppStrings.strBlogApp,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryUpdateSelectedState) {
            BlogPostCubit.get(context).fetchAllBlogPosts(state.categoryId);
          }
        },
        child: Container(
          color: Colors.orangeAccent.withOpacity(0.3),
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              HomeCategoriesView(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: HomeBlogPostsView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
