import 'dart:convert';
import 'package:admin_panel_tm_store_app/models/category.dart';
import 'package:admin_panel_tm_store_app/models/subCategory.dart';
import 'package:admin_panel_tm_store_app/service/manage_http_response.dart';
import 'package:admin_panel_tm_store_app/utils/http/global_variables.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

// class CategoryController {
//   uploadCategory({required dynamic pickedImage, required dynamic pickedBanner}) async {
//     try {
//       final cloudinary = CloudinaryPublic("dzyyk4fit", "uovja7tc"); 

//       // upload image
//       CloudinaryResponse imageResponse = await cloudinary.uploadFile(
//         CloudinaryFile.fromBytesData(pickedImage, identifier: "pickedImage", folder: "categoryImages")
//       );
//       print(imageResponse);

//         CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
//         CloudinaryFile.fromBytesData(pickedBanner, identifier: "pickedBanner", folder: "categoryImages")
//       );
//       print(bannerResponse);

//     } catch (e) {
//       print("Error uploading to Cloudinary: $e"); 
//     }
//   }
// }

class CategoryController extends GetxController {

 final isUploading = false.obs;

  Future<void> uploadCategory({
    required List<int> pickedImage,
    required List<int> pickedBanner,
    required String name,
    required BuildContext context,
  }) async {
    try {
      isUploading.value = true;


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

      final bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedBanner,
          identifier: "pickedBanner",
          folder: "categoryImages",
        ),
      );

      print(bannerResponse);
      String bannerImage = bannerResponse.secureUrl;

      await Future.delayed(const Duration(seconds: 2));

      CategoryMode category = CategoryMode(id :"", 
      name: name, 
      image: categoryImage,
      createdAt: DateTime.now(),
      banner: bannerImage
       );
      http.Response response = await http.post(Uri.parse("$uri/api/category"), 
       body: category.toJson(),
       headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });
       
       manageHttpResponse(response: response, context: context , onSuccess: () {
         showSnackBar(context, "Category Created Successfully");
       });
        Get.snackbar("Success", "Category created successfully");
      
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
    } finally {
      isUploading.value = false;
    }
  }

  void uploadBanner({required List<int> pickedImage, required List<int> pickedBanner, required String name, required String description, required BuildContext context}) {}
  
  
   Future<List<CategoryMode>> getCategory() async {
    try {
         http.Response response = await http.get(Uri.parse("$uri/api/categories"),
          headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });
      // print(response.body);
    //    if (response.statusCode == 200){
    //       final List<dynamic> categoryList = jsonDecode(response.body);
    //       List<CategoryMode> categories = categoryList.map((category) => CategoryMode.fromJson(category)).toList();
    //       return categories;
    //    } else {
    //     throw Exception('Failed to load Categories');
    //    }
    // } catch (e) {
    //   throw Exception('Error loading Categories: $e');
    // }
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
    required List<int> pickedBanner,
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

  //void uploadSubCategory({required List<int> pickedImage, required String name, required BuildContext context}) {}

    
  //  Future<List<SubCategoryMode>> getSubCategory() async {
  //   try {
  //        http.Response response = await http.get(Uri.parse("$uri/api/subcategories"),
  //         headers: <String, String>{
  //       "Content-Type": 'application/json; charset=UTF-8'
  //      });
  //      print(response.body);

  //     if (response.statusCode == 200) {

  //       List<dynamic> subSategoryList = jsonDecode(response.body);
  //       List<SubCategoryMode> subCategories = subSategoryList.map((subCategory) => SubCategoryMode.fromJson(subCategory)).toList();
  //       return subCategories;
  //   } else {
  //     throw Exception('Failed to load Categories');
  //   }
  // } catch (e) {
  //   throw Exception('Error loading Categories: $e');
  // }
  // }

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

