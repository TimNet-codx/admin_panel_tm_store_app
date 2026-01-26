import 'dart:convert';
import 'package:admin_panel_tm_store_app/models/brand.dart';
import 'package:admin_panel_tm_store_app/models/category.dart';
import 'package:admin_panel_tm_store_app/service/manage_http_response.dart';
import 'package:admin_panel_tm_store_app/utils/http/global_variables.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;


class  BrandController {

   Future<List<CategoryMode>> getCategory() async {
    try {
         http.Response response = await http.get(Uri.parse("$uri/api/categories"),
          headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });

      if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // 👇 CHANGE THIS KEY to match your API
      final List<dynamic> categoryList = data['categories'];

      return categoryList
          .map((category) => CategoryMode.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load Categories');
    }
  } catch (e) {
    throw Exception('Error loading Categories: $e');
  }
  }


  Future<void> uploadBrand({
    required List<int> pickedImage,
    // required List<int> pickedBrand,
    required String brandName,
    required String categoryName,

    required context, required String categoryId,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dzyyk4fit", "uovja7tc");

      final imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: "pickedImage",
          folder: "brandImages",
        ),
      );
      //print(imageResponse);
      String categoryImage = imageResponse.secureUrl;


      BrandMode brand = BrandMode(id: "", categoryId: categoryId, image: categoryImage, brandName: brandName, categoryName: categoryName, createdAt: DateTime.now());
      http.Response response = await http.post(Uri.parse("$uri/api/brand"), 
       body: brand.toJson(),
       headers: <String, String>{   
        "Content-Type": 'application/json; charset=UTF-8'
       });
       
       manageHttpResponse(response: response, context: context , onSuccess: () {
         showSnackBar(context, "Brand Created Successfully");
       });
      
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
    }
  }
  
Future<List<BrandMode>> getBrands() async {
  try {
    final response = await http.get(Uri.parse("$uri/api/brands"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    // print("RAW RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);

      // ✅ MUST match backend key
      final List<dynamic> brandList = decoded['brands'];

      return brandList
          .map((e) => BrandMode.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load brands');
    }
  } catch (e) {
    throw Exception('Error loading brands: $e');
  }
}

}

