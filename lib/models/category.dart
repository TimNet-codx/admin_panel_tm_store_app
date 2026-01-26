import 'dart:convert';

class CategoryMode{
  final String id;
  final String name;
  final String image;
  final DateTime createdAt; 
  final String banner;

  CategoryMode({required this.id,
   required this.name, 
   required this.image,
   required this.createdAt,
    required this.banner
    });


  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id": id,
      "name": name,
      "image": image,
      "createdAt": createdAt.toIso8601String(),
      "banner": banner,
    };
  }

  String toJson()=> json.encode(toMap());


  factory CategoryMode.fromJson(Map<String, dynamic> map){
    return CategoryMode(
      id: map["_id"] as String? ?? "",
      name: map["name"] as String? ?? "",
      image: map["image"] as String? ?? "", 
      // createdAt: DateTime.parse(map["createdAt"]),
      createdAt: map["createdAt"] != null
        ? DateTime.parse(map["createdAt"])
        : DateTime.now(),
      banner: map["banner"] as String? ?? "",
      );
  }


 // factory CategoryMode.fromJson (String source) => CategoryMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
