part of 'education_cubit.dart';

@immutable
abstract class EducationState {}

class EducationInitial extends EducationState {}
class EducationLoadingState extends EducationState {}
class EducationSuccessState extends EducationState {
  final EducationModel data;

  EducationSuccessState(this.data);

}
class EducationErrorState extends EducationState {
  final String error;

  EducationErrorState(this.error);
}
