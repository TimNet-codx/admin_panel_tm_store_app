import 'dart:convert';

class SubCategoryMode{
  final String id;
  final String categoryId;
  final String image;
  final String subCategoryName;
  final String categoryName;
  final DateTime createdAt; 


  SubCategoryMode({required this.id, required this.categoryId, required this.image, required this.subCategoryName, required this.categoryName, required this.createdAt});
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id": id,
      "categoryId": categoryId,
      "image": image,
      "subCategoryName": subCategoryName,
      "categoryName": categoryName,
      "createdAt": createdAt.toIso8601String(),

    };
  }

  String toJson()=> json.encode(toMap());


  factory SubCategoryMode.fromJson(Map<String, dynamic> map){
    return SubCategoryMode(
      id: map["_id"] as String? ?? "",
      categoryId: map["categoryId"] as String? ?? "",
      image: map["image"] as String? ?? "", 
      subCategoryName: map["subCategoryName"] as String? ?? "",
      categoryName: map["categoryName"] as String? ?? "",
      createdAt: map["createdAt"] != null
        ? DateTime.parse(map["createdAt"])
        : DateTime.now(),
      );
  }


 // factory CategoryMode.fromJson (String source) => CategoryMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
