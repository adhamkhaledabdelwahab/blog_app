part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryUpdateSelectedState extends CategoryState {
  final int? categoryId;

  CategoryUpdateSelectedState(this.categoryId);
}

class CategoryFetchDataLoadingState extends CategoryState {}

class CategoryFetchDataSuccessState extends CategoryState {}

class CategoryFetchDataFailureState extends CategoryState {
  final String message;

  CategoryFetchDataFailureState(this.message);
}
