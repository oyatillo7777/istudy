class ResponseModel {
  String? id;
  bool? flag;
  String? message;
  DataModel? data;

  ResponseModel({this.id, this.flag, this.message, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['\$id'],
      flag: json['flag'],
      message: json['message'],
      data: json['data'] != null
          ? DataModel.fromJson(
              json['data'],
            )
          : null,
    );
  }
}

class DataModel {
  String? id;
  List<CategoryModel>? values;

  DataModel({this.id, this.values});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['\$id'],
      values: (json['\$values'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}

class CategoryModel {
  String? id;
  String? name;
  String? description;

  CategoryModel({this.id, this.name, this.description});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['\$id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
