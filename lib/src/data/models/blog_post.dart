import 'package:blog_app/src/data/models/category.dart';

class BlogPost {
  int id;
  String title;
  String details;
  String? featuredImageUrl;
  String? createdAt;
  Category category;

  BlogPost({
    required this.id,
    required this.title,
    required this.details,
    this.featuredImageUrl,
    this.createdAt,
    required this.category,
  });

  BlogPost.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        details = json['details'],
        featuredImageUrl = json['featured_image_url'],
        createdAt = json['created_at'],
        category = Category.fromJson(json['category']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['featured_image_url'] = featuredImageUrl;
    data['created_at'] = createdAt;
    data['category'] = category;
    return data;
  }
}
