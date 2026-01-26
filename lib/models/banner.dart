import 'dart:convert';

class BannerModel{
  final String id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt; 

  BannerModel({required this.id, required this.title, required this.description, required this.image, required this.createdAt});


  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      "createdAt": createdAt.toIso8601String(),

    };
  }

  String toJson()=> json.encode(toMap());


  // factory Banner.fromMap(Map<String, dynamic> map){
  //   return Banner(
  //     id: map["_id"] as String? ?? "",
  //     title: map["title"] as String? ?? "",
  //     description: map["description"] as String? ?? "",
  //     image: map["image"] as String? ?? "",
  //     );
  // }
  factory BannerModel.fromJson(Map<String, dynamic> map){
    return BannerModel(
      id: map["_id"] as String? ?? "",
      title: map["title"] as String? ?? "",
      description: map["description"] as String? ?? "",
      image: map["image"] as String? ?? "",
      createdAt: map["createdAt"] != null
        ? DateTime.parse(map["createdAt"])
        : DateTime.now(),
      );
  }


  //factory Banner.fromJson (String source) => Banner.fromMap(json.decode(source) as Map<String, dynamic>);
}
