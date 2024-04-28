class EducationModel {
  List<ItemModel> values;

  EducationModel({required this.values});

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    var valuesList = json['data']['\$values'] as List<dynamic>;
    List<ItemModel> items = valuesList.map((e) => ItemModel.fromJson(e)).toList();
    return EducationModel(values: items);
  }
}

class ItemModel {
  int id;
  String name;
  String description;

  ItemModel({required this.id, required this.name, required this.description});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
