import 'dart:io';
import 'package:admin_panel_tm_store_app/PickedImage/pickedImage.dart';
import 'package:admin_panel_tm_store_app/PickedImage/valueNotifier.dart';
import 'package:admin_panel_tm_store_app/controllers/banner_Controller.dart';
import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
import 'package:admin_panel_tm_store_app/view/router/categories/widgets/ImagePickerRow.dart';
import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';
import 'package:flutter/material.dart';



class CreateBannerScreen extends StatelessWidget {
  final ValueNotifier<PickedImage?> imageNotifier;
  final VoidCallback onPickImage;
  

  const CreateBannerScreen({
    super.key,
    required this.imageNotifier,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final BannerController bannerController = BannerController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
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
                              'Create Banner',
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
                                        'Create New Banner',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),                                                    
                                  /// Name field
                                  TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if(value!.isNotEmpty){
                                        return null;
                                      }else {
                                        return 'Please enter a banner title';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Banner Title',
                                      prefixIcon: const Icon(
                                        Icons.title,
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
                                    TextFormField(
                                    controller: descriptionController,
                                    validator: (value) {
                                      if(value!.isNotEmpty){
                                        return null;
                                      }else {
                                        return 'Please enter a description';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Description',
                                      prefixIcon: const Icon(
                                        Icons.description,
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
                          
                                  const SizedBox(height: TSizes.spaceBtwSections),
                          
                                  /// Image picker (WORKING)
                               Row(
                                children: [
                                    ValueListenableBuilder<PickedImage?>(
                                    valueListenable: imageBannerNotifier,
                                    builder: (context, image, _) {
                                      return ImagePickerRow(
                                       file: image?.file,
                                       bytes: image?.bytes,
                                       onPick: pickedBanner,
                                       buttonText: 'Uplaod Banner Image',
                                      );
                                    },
                                  ),
                          
                          
                                ],
                               ),
                                 
                              const SizedBox(height: TSizes.defaultSpace),
                          
                                  /// Create button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                             
                                            final banner = imageBannerNotifier.value;

                                            if (banner == null) {
                                              print("Please select banner");
                                              return;
                                            }

                                            bannerController.uploadBanner(     
                                             pickedBanner: banner.bytes!.toList(), 
                                             title: titleController.text.trim(),
                                             description: descriptionController.text.trim(),
                                             context: context,  
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff5867ff),
                                      ),
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
