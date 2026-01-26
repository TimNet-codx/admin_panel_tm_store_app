import 'dart:convert';
//import 'dart:math' as console;
import 'package:admin_panel_tm_store_app/models/category.dart';
import 'package:admin_panel_tm_store_app/models/subCategory.dart';
import 'package:admin_panel_tm_store_app/service/manage_http_response.dart';
import 'package:admin_panel_tm_store_app/utils/http/global_variables.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;


class SubcategoryController {

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


  Future<void> uploadSubCategory({
    required List<int> pickedImage,
    // required List<int> pickedBanner,
    required String subCategoryName,
    required String categoryName,

    required context, required String categoryId,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dzyyk4fit", "uovja7tc");

      final imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: "pickedImage",
          folder: "categoryImages",
        ),
      );
      //print(imageResponse);
      String categoryImage = imageResponse.secureUrl;


      SubCategoryMode category = SubCategoryMode(id: categoryId, categoryId: categoryId, image: categoryImage, subCategoryName: subCategoryName, categoryName: categoryName, createdAt: DateTime.now());
      http.Response response = await http.post(Uri.parse("$uri/api/subcategory"), 
       body: category.toJson(),
       headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });
       
       manageHttpResponse(response: response, context: context , onSuccess: () {
         showSnackBar(context, "SubCategory Created Successfully");
       });
      
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
    }
  }
  
Future<List<SubCategoryMode>> getSubCategory() async {
  try {
    final response = await http.get(
      Uri.parse("$uri/api/subcategories"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    // print("RAW RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);

      // ✅ MUST match backend key
      final List<dynamic> subCategoryList = decoded['subCategories'];

      return subCategoryList
          .map((e) => SubCategoryMode.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load SubCategories');
    }
  } catch (e) {
    throw Exception('Error loading SubCategories: $e');
  }
}

}

