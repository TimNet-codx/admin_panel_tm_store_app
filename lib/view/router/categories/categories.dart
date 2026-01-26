import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
import 'package:admin_panel_tm_store_app/view/router/categories/widgets/categoriesList.dart';
import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Scaffold(
      body: Row(
        children: [
          if (!isMobile) const Sidebar(),

          // Page Content
          Expanded(
            child: Column(
              children: [
                Topbar(
                  onMenuTap: () {
                    if (isMobile) {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const SizedBox(
                          height: 400,
                          child: Sidebar(),
                        ),
                      );
                    }
                  },
                ),
                CategoriesListScreen(),
                //CreateCategoryScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
