import 'package:blog_app/src/bussiness_logic/blog_post_cubit/blog_post_cubit.dart';
import 'package:blog_app/src/presentation/router/app_router_names.dart';
import 'package:blog_app/src/presentation/views/blog_post_view_item.dart';
import 'package:blog_app/src/presentation/views/blog_posts_loading_view.dart';
import 'package:blog_app/src/presentation/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlogPostsView extends StatelessWidget {
  const HomeBlogPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogPostCubit, BlogPostState>(
      builder: (context, state) {
        final cubit = BlogPostCubit.get(context);
        switch (state) {
          case BlogPostFetchDataLoadingState():
            return const BlogPostsLoadingView();
          case BlogPostFetchDataSuccessState():
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BlogPostViewItem(
                blogPost: cubit.blogPostsResponse.blogPosts[index],
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRouterNames.rBlogPost,
                  arguments: cubit.blogPostsResponse.blogPosts[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: cubit.blogPostsResponse.blogPosts.length,
            );
          default:
            final st = state as BlogPostFetchDataFailureState;
            return CustomErrorWidget(
              message: st.message,
            );
        }
      },
    );
  }
}
