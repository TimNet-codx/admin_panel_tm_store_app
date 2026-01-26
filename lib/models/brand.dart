import 'dart:convert';

class BrandMode{
  final String id;
  final String categoryId;
  final String image;
  final String brandName;
  final String categoryName;
  final DateTime createdAt; 


  BrandMode({required this.id, required this.categoryId, required this.image, required this.brandName, required this.categoryName, required this.createdAt});
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id": id,
      "categoryId": categoryId,
      "image": image,
      "brandName": brandName,
      "categoryName": categoryName,
      "createdAt": createdAt.toIso8601String(),


    };
  }

  String toJson()=> json.encode(toMap());


  factory BrandMode.fromJson(Map<String, dynamic> map){
    return BrandMode(
      id: map["_id"] as String? ?? "",
      categoryId: map["categoryId"] as String? ?? "",
      image: map["image"] as String? ?? "", 
      brandName: map["brandName"] as String? ?? "",
      categoryName: map["categoryName"] as String? ?? "",
      createdAt: map["createdAt"] != null
        ? DateTime.parse(map["createdAt"])
        : DateTime.now(),
      );
  }


 // factory CategoryMode.fromJson (String source) => CategoryMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
