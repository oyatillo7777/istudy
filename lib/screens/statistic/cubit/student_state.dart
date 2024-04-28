part of 'student_cubit.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoadingState extends StudentState {}

class StudentSuccessState extends StudentState {
  final StudentModel data;

  StudentSuccessState(this.data);
}

class StudentErrorState extends StudentState {
  final String error;

  StudentErrorState(this.error);

}
