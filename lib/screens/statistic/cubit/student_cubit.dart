import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:istudy/model/student/student.dart';
import 'package:istudy/service/student/student.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentService studentService = StudentService();

  StudentCubit() : super(StudentInitial());

  Future<void> getStudent() async {
    emit(StudentLoadingState());
    try {
      Either<String, StudentModel> data = await studentService.getStudent();
      data.fold(
        (l) => emit(
          StudentErrorState(l),
        ),
        (r) => emit(
          StudentSuccessState(r),
        ),
      );
    } catch (e) {
      emit(
        StudentErrorState(e.toString()),
      );
    }
  }
}
