class StudentModel {
  String id;
  Data data;

  StudentModel({required this.id, required this.data});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['\$id'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'data': data.toJson(),
    };
  }
}

class Data {
  String id;
  List<Value> values;

  Data({required this.id, required this.values});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['\$id'] ?? '',
      values: (json['\$values'] as List<dynamic>?)
          ?.map((value) => Value.fromJson(value))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      '\$values': values.map((value) => value.toJson()).toList(),
    };
  }
}

class Value {
  dynamic id;
  String fullname;
  int age;
  int ball;
  Lessons lessons;

  Value({
    required this.id,
    required this.fullname,
    required this.age,
    required this.ball,
    required this.lessons,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      id: json['\$id'] ?? 0,
      fullname: json['fullname'] ?? '',
      age: json['age'] ?? 0,
      ball: json['ball'] ?? 0,
      lessons: Lessons.fromJson(json['lessons'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'fullname': fullname,
      'age': age,
      'ball': ball,
      'lessons': lessons.toJson(),
    };
  }
}

class Lessons {
  String id;
  List<dynamic> values;

  Lessons({required this.id, required this.values});

  factory Lessons.fromJson(Map<String, dynamic> json) {
    return Lessons(
      id: json['\$id'] ?? '',
      values: json['\$values'] as List<dynamic>? ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      '\$values': values,
    };
  }
}
