import 'dart:developer';

import 'package:blog_app/src/core/constants/end_points.dart';
import 'package:blog_app/src/core/services/dio_service.dart';
import 'package:blog_app/src/data/response_models/fetch_blog_posts/fetch_blog_posts_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_post_state.dart';

class BlogPostCubit extends Cubit<BlogPostState> {
  BlogPostCubit() : super(BlogPostInitialState());

  static BlogPostCubit get(BuildContext context) => BlocProvider.of(context);

  late FetchBlogPostsResponse _blogPostsResponse;

  FetchBlogPostsResponse get blogPostsResponse => _blogPostsResponse;

  int? selectedCategoryId;

  Future fetchAllBlogPosts([int? categoryId]) async {
    if (categoryId != null) {
      selectedCategoryId = categoryId;
    }
    try {
      emit(BlogPostFetchDataLoadingState());
      final response = await DioService.get(
        path: EndPoints.epGetAllBlogPosts,
        queryParameters: {
          if (selectedCategoryId != null) "category_id": selectedCategoryId,
        },
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
      );
      _blogPostsResponse = FetchBlogPostsResponse.fromJson(response.data);
      emit(BlogPostFetchDataSuccessState());
    } catch (e) {
      log("fetchAllBlogPosts error: $e", name: "fetchAllBlogPosts");
      emit(BlogPostFetchDataFailureState(e.toString()));
    }
  }
}
