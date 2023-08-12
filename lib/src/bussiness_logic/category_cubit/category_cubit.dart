import 'dart:developer';

import 'package:blog_app/src/core/constants/end_points.dart';
import 'package:blog_app/src/core/services/dio_service.dart';
import 'package:blog_app/src/data/models/category.dart';
import 'package:blog_app/src/data/response_models/fetch_categories/fetch_categories_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(BuildContext context) => BlocProvider.of(context);

  late FetchCategoriesResponse categoriesResponse;
  late Category selected;
  final Category all = Category(id: 0, name: "All");

  Future fetchAllCategories() async {
    try {
      emit(CategoryFetchDataLoadingState());
      final response = await DioService.get(
        path: EndPoints.epGetAllCategories,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
      );
      log(response.data.toString(), name: "fetchAllCategories");
      categoriesResponse = FetchCategoriesResponse.fromJson(
        response.data,
      );
      selected = all;
      emit(CategoryFetchDataSuccessState());
    } catch (e) {
      log("fetchAllCategories error: $e", name: "fetchAllCategories");
      emit(CategoryFetchDataFailureState(e.toString()));
    }
  }

  void updateSelectedCategory(int index) {
    selected = index == 0 ? all : categoriesResponse.categories[index - 1];
    emit(CategoryUpdateSelectedState(selected.id));
  }
}
