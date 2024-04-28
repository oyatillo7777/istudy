import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../model/education/education.dart';
import '../../tools/dio.dart';

class EducationService{
  final Dio _dioConfig = DioConfig.getDio();
  
  Future<Either<String,EducationModel>>getEducation()async{
    final response=await _dioConfig.get('Education/educations');
    try{
      if(response.statusCode==200){
        return right(EducationModel.fromJson(response.data));
      }else{
        return left('error');
      }
    }catch(e){
      return left(e.toString());
    }
  }
}