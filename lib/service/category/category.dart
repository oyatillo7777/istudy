import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:istudy/model/category/categoryModel.dart';

import '../../tools/dio.dart';

class CategoryService {
  final Dio _dioConfig = DioConfig.getDio();

  Future<Either<String, ResponseModel>> getCategory() async {
    final response = await _dioConfig.get('Category/categories');
    try {
      if (response.statusCode == 200) {
         return right(

             ResponseModel.fromJson(response.data)

        );
      } else {
        return left(response.data['message']);
      }
    } catch (e) {
      return left(
        response.data['message'],
      );
    }
  }
}
