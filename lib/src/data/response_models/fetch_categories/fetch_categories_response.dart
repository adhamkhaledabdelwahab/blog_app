import 'package:blog_app/src/data/models/category.dart';

class FetchCategoriesResponse {
  List<Category> categories;

  FetchCategoriesResponse({required this.categories});

  FetchCategoriesResponse.fromJson(Map<String, dynamic> json)
      : categories = (json['data'] as List<dynamic>)
            .map(
              (e) => Category.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = categories.map((v) => v.toJson()).toList();
    return data;
  }
}
