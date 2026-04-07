import 'package:admin_panel_tm_store_app/view/authentication/screens/login/login.dart';
import 'package:admin_panel_tm_store_app/utils/constants/text_strings.dart';
import 'package:admin_panel_tm_store_app/utils/theme/theme.dart';
import 'package:admin_panel_tm_store_app/view/dashboard/dashboardScreen.dart';
import 'package:admin_panel_tm_store_app/view/router/banners/banners.dart';
import 'package:admin_panel_tm_store_app/view/router/brands/brands.dart';
import 'package:admin_panel_tm_store_app/view/router/categories/categories.dart';
import 'package:admin_panel_tm_store_app/view/router/media/media.dart';
import 'package:admin_panel_tm_store_app/view/router/products/products.dart';
import 'package:admin_panel_tm_store_app/view/router/subCategories/subCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //title: 'Admin Panel TM Stre App',
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
          //  Register ALL ROUTES here
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/media': (context) => const MediaScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/subcategories': (context) => const SubCategoriesScreen(),
        '/brands': (context) => const BrandsScreen(),
        // '/addProduct': (context) => const AddProductScreen(),
        '/products': (context) => const ProductScreen(),
        // '/products': (context) => const ProductsPage(),
        // '/orders': (context) => const OrdersPage(),
         '/banners': (context) => const BannersScreen(),
      },
      home: const LoginScreen()
    );
  }
}

class DashboardPage {
  const DashboardPage();
}




