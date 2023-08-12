part of 'blog_post_cubit.dart';

@immutable
abstract class BlogPostState {}

class BlogPostInitialState extends BlogPostState {}

class BlogPostFetchDataLoadingState extends BlogPostState {}

class BlogPostFetchDataSuccessState extends BlogPostState {}

class BlogPostFetchDataFailureState extends BlogPostState {
  final String message;

  BlogPostFetchDataFailureState(this.message);
}
