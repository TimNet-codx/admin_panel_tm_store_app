import 'dart:io';
import 'package:admin_panel_tm_store_app/PickedImage/pickedImage.dart';
import 'package:admin_panel_tm_store_app/PickedImage/valueNotifier.dart';
import 'package:admin_panel_tm_store_app/controllers/subcategory_Controller.dart';
import 'package:admin_panel_tm_store_app/models/category.dart';
import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
import 'package:admin_panel_tm_store_app/view/router/categories/widgets/ImagePickerRow.dart';
import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';
import 'package:flutter/material.dart';


class CreateSubCategoryScreen extends StatelessWidget {
  final ValueNotifier<PickedImage?> imageNotifier;
  final ValueNotifier<String?> selectedCategoryIdNotifier =
    ValueNotifier<String?>(null);

final ValueNotifier<String?> selectedCategoryNameNotifier =
    ValueNotifier<String?>(null);

  final VoidCallback onPickImage;
  void setState(Null Function() param0) {}
  

   CreateSubCategoryScreen({
    super.key,
    required this.imageNotifier,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final SubcategoryController subcategoryController = SubcategoryController();
    final TextEditingController subCategoryNameController = TextEditingController();
    String? selectedCategoryId;
    String? categoryName;

    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      drawer: isMobile ? const Drawer(child: Sidebar()) : null,
      body: Row(
        children: [
          if (!isMobile) const Sidebar(),

          Expanded(
            child: Column(
              children: [
                Topbar(
                  onMenuTap: () {
                    if (isMobile) {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Header
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Create Sub Category',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Form(
                          key: _formKey,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 500,
                              width: 800,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.purple[50],
                                        child: const Icon(
                                          Icons.space_dashboard_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      // const SizedBox(width: 13),
                                      const SizedBox(width: TSizes.md),
                          
                                      const Text(
                                        'Create new Sub Category',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwSections),                                                    
                                  /// Name field
                                  TextFormField(
                                    //  onChanged: (value){
                                    //   name = value;
                                    // },
                                    controller: subCategoryNameController,
                                    validator: (value) {
                                      if(value!.isNotEmpty){
                                        return null;
                                      }else {
                                        return 'Please enter a category name';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Sub Category Name',
                                      prefixIcon: const Icon(
                                        Icons.space_dashboard_outlined,
                                        size: 32,
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xfff6f7f9),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                          
                               const SizedBox(height: TSizes.spaceBtwItems),
                                // FutureBuilder<List<SubCategoryMode>>(
                                //     future: categoryController.getSubCategory(),
                                //     builder: (context, snapshot) {
                                //       if (snapshot.connectionState == ConnectionState.waiting) {
                                //         return const CircularProgressIndicator();
                                //       }

                                //       if (snapshot.hasError) {
                                //         return Text(snapshot.error.toString());
                                //       }

                                //       final categories = snapshot.data!;

                                //       return DropdownButtonFormField<String>(
                                //         value: selectedCategoryId,
                                //         validator: (value) {
                                //           if (value == null) {
                                //             return 'Please select a category';
                                //           }
                                //           return null;
                                //         },
                                //         items: categories.map((category) {
                                //           return DropdownMenuItem<String>(
                                //             value: category.id,
                                //             child: Text(category.categoryName),
                                //           );
                                //         }).toList(),
                                //         onChanged: (value) {
                                //           setState(() {
                                //             selectedCategoryId = value;
                                //           });
                                //         },
                                //         decoration: InputDecoration(
                                //           hintText: 'Select Category',
                                //           prefixIcon: const Icon(Icons.space_dashboard_outlined, size: 32),
                                //           filled: true,
                                //           fillColor: const Color(0xfff6f7f9),
                                //           border: OutlineInputBorder(
                                //             borderRadius: BorderRadius.circular(8),
                                //             borderSide: BorderSide.none,
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                FutureBuilder<List<CategoryMode>>(
                                  future: subcategoryController.getCategory(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }
                                    final categories = snapshot.data!;

                                    return ValueListenableBuilder<String?>(
                                      valueListenable: selectedCategoryIdNotifier,
                                      builder: (context, selectedId, _) {
                                        return DropdownButtonFormField<String>(
                                          value: selectedId,
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select a category';
                                            }
                                            return null;
                                          },
                                          items: categories.map((category) {
                                            return DropdownMenuItem<String>(
                                              value: category.id,
                                              child: Text(category.name),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            selectedCategoryIdNotifier.value = value;

                                            final selectedCategory = categories
                                                .firstWhere((cat) => cat.id == value);

                                            selectedCategoryNameNotifier.value =
                                                selectedCategory.name;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Select Category',
                                            prefixIcon:
                                                const Icon(Icons.arrow_drop_down, size: 32),
                                            filled: true,
                                            fillColor: const Color(0xfff6f7f9),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),

                              const SizedBox(height: TSizes.spaceBtwSections),
                          
                              ValueListenableBuilder<PickedImage?>(
                                      valueListenable: imageNotifier,
                                      builder: (context, image, _) {
                                        return ImagePickerRow(
                                        file: image?.file,
                                        bytes: image?.bytes,
                                        onPick: pickedImage,
                                        buttonText: 'Uplaod Category Image',
                                        );
                                      },
                                    ),
                              const SizedBox(height: TSizes.defaultSpace),
                          
                                  /// Create button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 45,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            final image = imageNotifier.value;

                                            if (image == null) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Please upload image')),
                                              );
                                              return;
                                            }

                                            if (selectedCategoryIdNotifier.value == null) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Select a category')),
                                              );
                                              return;
                                            }

                                            subcategoryController.uploadSubCategory(
                                              pickedImage: image.bytes!.toList(),
                                              subCategoryName: subCategoryNameController.text.trim(),
                                              categoryId: selectedCategoryIdNotifier.value!,
                                              categoryName: selectedCategoryNameNotifier.value!,
                                              context: context,
                                            );
                                          }
                                        },
                                        child: const Text('Create'),
                                      ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  
}
