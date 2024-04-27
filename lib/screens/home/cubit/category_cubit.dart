import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:istudy/service/category/category.dart';
import 'package:meta/meta.dart';

import '../../../model/category/categoryModel.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService categoryService = CategoryService();

  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    try {
      final Either<String, ResponseModel> data =
          await categoryService.getCategory();
      data.fold((l) => emit(CategoryErrorState(l)),
          (data) => emit(CategorySuccessState(data)));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }
}
