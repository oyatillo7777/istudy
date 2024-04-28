import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:istudy/model/student/student.dart';
import 'package:istudy/tools/dio.dart';

class StudentService {
  final Dio _dioConfig = DioConfig.getDio();

  Future<Either<String, StudentModel>> getStudent() async {
    final response = await _dioConfig.get('Student/students');
    try {
      if(response.statusCode==200){
        return right(StudentModel.fromJson(response.data));
      }else{
        return left('error');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
