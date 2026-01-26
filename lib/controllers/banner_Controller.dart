
import 'dart:convert';

import 'package:admin_panel_tm_store_app/models/banner.dart';
import 'package:admin_panel_tm_store_app/service/manage_http_response.dart';
import 'package:admin_panel_tm_store_app/utils/http/global_variables.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;


class BannerController {

  Future<void> uploadBanner({
    required List<int> pickedBanner,
    required String title,
    required String description,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dzyyk4fit", "uovja7tc");


      final bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedBanner,
          identifier: "pickedBanner",
          folder: "bannerImages",
        ),
      );

      //print(bannerResponse);
      String bannerImage = bannerResponse.secureUrl;

      BannerModel banner = BannerModel(id :"", title: title, description: description, image: bannerImage, createdAt: DateTime.now()
);
      http.Response response = await http.post(Uri.parse("$uri/api/banner"), 
       body: banner.toJson(),
       headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });
       
       manageHttpResponse(response: response, context: context , onSuccess: () {
         showSnackBar(context, "Banner Created Successfully");
       });
      
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
         http.Response response = await http.get(Uri.parse("$uri/api/banners"),
          headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
       });
      //  print(response.body);
       if (response.statusCode == 200){
          List<dynamic> bannerList = jsonDecode(response.body);
          List<BannerModel> banners = bannerList.map((banner) => BannerModel.fromJson(banner)).toList();
          return banners;
       } else {
        throw Exception('Failed to load Banners');
       }
    } catch (e) {
      throw Exception('Error loading Banners: $e');
    }
  }
}

