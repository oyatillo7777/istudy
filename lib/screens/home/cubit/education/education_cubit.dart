import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:istudy/model/education/education.dart';
import 'package:istudy/service/education/education.dart';
import 'package:meta/meta.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationService educationService = EducationService();

  EducationCubit() : super(EducationInitial());

  Future<void> getEducation() async {
    emit(EducationLoadingState());
    try {
      Either<String, EducationModel> data =
          await educationService.getEducation();
      data.fold(
        (l) => emit(
          EducationErrorState(l),
        ),
        (r) => emit(
          EducationSuccessState(r),
        ),
      );
    } catch (e) {
      emit(
        EducationErrorState(
          e.toString(),
        ),
      );
    }
  }
}
