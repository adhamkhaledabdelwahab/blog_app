import 'package:blog_app/src/bussiness_logic/category_cubit/category_cubit.dart';
import 'package:blog_app/src/presentation/views/categories_%20loading_view.dart';
import 'package:blog_app/src/presentation/views/category_view_item.dart';
import 'package:blog_app/src/presentation/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoriesView extends StatelessWidget {
  const HomeCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final cubit = CategoryCubit.get(context);
          switch (state) {
            case CategoryFetchDataLoadingState():
              return const CategoriesLoadingView();
            case CategoryFetchDataSuccessState() ||
                  CategoryUpdateSelectedState():
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategoryViewItem(
                  category: index == 0
                      ? cubit.all
                      : cubit.categoriesResponse.categories[index - 1],
                  onTap: () => cubit.updateSelectedCategory(index),
                  selected: (index == 0 && cubit.selected.id == 0) ||
                      (index != 0 &&
                          cubit.categoriesResponse.categories[index - 1].id ==
                              cubit.selected.id),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: cubit.categoriesResponse.categories.length + 1,
              );
            default:
              final st = state as CategoryFetchDataFailureState;
              return CustomErrorWidget(
                message: st.message,
              );
          }
        },
      ),
    );
  }
}
