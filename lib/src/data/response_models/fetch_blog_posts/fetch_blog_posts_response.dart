import 'package:blog_app/src/data/models/blog_post.dart';

class FetchBlogPostsResponse {
  List<BlogPost> blogPosts;

  FetchBlogPostsResponse({required this.blogPosts});

  FetchBlogPostsResponse.fromJson(Map<String, dynamic> json)
      : blogPosts = (json['data'] as List)
            .map((v) => BlogPost.fromJson(v))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = blogPosts.map((v) => v.toJson()).toList();
    return data;
  }
}
