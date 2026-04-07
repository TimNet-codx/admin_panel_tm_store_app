// import 'package:flutter/material.dart';
// class CreateCategoryScreen extends StatefulWidget {
//   const CreateCategoryScreen({super.key});

//   @override
//   State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
// }

// class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
//   final _nameController = TextEditingController();
//   bool _featured = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'Create Category',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           // Name input
//           TextField(
//             controller: _nameController,
//             decoration: InputDecoration(
//               hintText: 'Category Name',
//               filled: true,
//               fillColor: const Color(0xfff6f7f9),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),

//           const SizedBox(height: 10),

//           // Checkbox
//           Row(
//             children: [
//               Checkbox(
//                 value: _featured,
//                 onChanged: (v) => setState(() => _featured = v ?? false),
//               ),
//               const Text('Featured'),
//             ],
//           ),

//           const SizedBox(height: 10),

//           // Upload row
//           Row(
//             children: [
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(Icons.image, size: 32),
//               ),
//               const SizedBox(width: 10),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(Icons.upload_file),
//                 label: const Text('Upload'),
//               ),
//             ],
//           ),

//           const Spacer(),

//           // Create button
//           SizedBox(
//             width: double.infinity,
//             height: 45,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff5867ff),
//               ),
//               child: const Text('Create'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
// import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';
// import 'package:flutter/material.dart';

// class CreateCategoryScreen extends StatelessWidget {
//   const CreateCategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;

//     return Scaffold(
//       drawer: isMobile ? const Drawer(child: Sidebar()) : null,
//       body: Row(
//         children: [
//           if (!isMobile) const Sidebar(),

//           Expanded(
//             child: Column(
//               children: [
//                 Topbar(
//                   onMenuTap: () {
//                     if (isMobile) {
//                       Scaffold.of(context).openDrawer();
//                     }
//                   },
//                 ),

//           Expanded(
//                   child: Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'Create Category',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           Center(
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               height: 350,
//               width: 800,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.grey.shade200)
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                 Row(
//                   children: [ 
//                    CircleAvatar(
//                     backgroundColor: Colors.purple[50],
//                     child: const Icon(Icons.space_dashboard_outlined, color: Colors.blue),
//                   ), 
             
//                   SizedBox(width: 13),
//                    const Text(
//                 'Create New Category',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),],),
//           const SizedBox(height: 15),

//           // Name input
//           TextField(
//             //controller: _nameController,
//             decoration: InputDecoration(
//               hintText: 'Category Name',
//               prefixIcon: Icon(Icons.space_dashboard_outlined, size: 32,),
//               filled: true,
//               fillColor: const Color(0xfff6f7f9),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),

//           const SizedBox(height: 10),

//           // Checkbox
//           // Row(
//           //   children: [
//           //     Checkbox(
//           //       value: _featured,
//           //       onChanged: (v) => setState(() => _featured = v ?? false),
//           //     ),
//           //     const Text('Featured'),
//           //   ],
//           // ),

//           const SizedBox(height: 10),

//           // Upload row
//           Row(
//             children: [
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(Icons.image, size: 32),
//               ),
//               const SizedBox(width: 10),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(Icons.upload_file),
//                 label: const Text('Upload'),
//               ),
//             ],
//           ),

//          // const Spacer(),
//           const SizedBox(height: 15),

//                   // Create button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xff5867ff),
//                       ),
//                       child: const Text('Create'),
//                     ),
//                   ),
//                 ],),
            
//             ),
//           ),
        

              
              
//                 ],
//               ),
//             ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:admin_panel_tm_store_app/PickedImage/pickedImage.dart';
import 'package:admin_panel_tm_store_app/PickedImage/valueNotifier.dart';
import 'package:admin_panel_tm_store_app/controllers/category_Controller.dart';
import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
import 'package:admin_panel_tm_store_app/view/router/categories/widgets/ImagePickerRow.dart';
import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// class CreateCategoryScreen extends StatelessWidget {


//   const CreateCategoryScreen({
//     super.key,
//    required ValueNotifier<File?> imageNotifier,
//   required VoidCallback onPickImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;

//     return Scaffold(
//       drawer: isMobile ? const Drawer(child: Sidebar()) : null,
//       body: Row(
//         children: [
//           if (!isMobile) const Sidebar(),

//           Expanded(
//             child: Column(
//               children: [
//                 Topbar(
//                   onMenuTap: () {
//                     if (isMobile) {
//                       Scaffold.of(context).openDrawer();
//                     }
//                   },
//                 ),

//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// Header
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.close),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                             const SizedBox(width: 8),
//                             const Text(
//                               'Create Category',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 15),

//                         Center(
//                           child: Container(
//                             padding: const EdgeInsets.all(16),
//                             height: 350,
//                             width: 800,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(color: Colors.grey.shade200),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: Colors.purple[50],
//                                       child: const Icon(
//                                         Icons.space_dashboard_outlined,
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 13),
//                                     const Text(
//                                       'Create New Category',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),

//                                 const SizedBox(height: 15),

//                                 /// Name field
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Category Name',
//                                     prefixIcon: const Icon(
//                                       Icons.space_dashboard_outlined,
//                                       size: 32,
//                                     ),
//                                     filled: true,
//                                     fillColor: const Color(0xfff6f7f9),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),

//                                 const SizedBox(height: 15),

//                                 /// Image picker (stateless)
//                                 ValueListenableBuilder<File?>(
//                                   valueListenable: imageNotifier,
//                                   builder: (context, image, _) {
//                                     return ImagePickerRow(
//                                       image: image,
//                                       onPick: onPickImage,
//                                     );
//                                   },
//                                 ),

//                                 const SizedBox(height: 20),

//                                 /// Create button
//                                 SizedBox(
//                                   width: double.infinity,
//                                   height: 45,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       // submit logic
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           const Color(0xff5867ff),
//                                     ),
//                                     child: const Text('Create'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class CreateCategoryScreen extends StatelessWidget {
  final ValueNotifier<PickedImage?> imageNotifier;
  final VoidCallback onPickImage;
  

  const CreateCategoryScreen({
    super.key,
    required this.imageNotifier,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final CategoryController categoryController = CategoryController();
    final TextEditingController nameController = TextEditingController();
    late String name; 
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
                              'Create Category',
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
                              height: 400,
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
                                        'Create New Category',
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
                                    controller: nameController,
                                    validator: (value) {
                                      if(value!.isNotEmpty){
                                        return null;
                                      }else {
                                        return 'Please enter a category name';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Category Name',
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
                          
                                  const SizedBox(height: TSizes.spaceBtwSections),
                          
                                  /// Image picker (WORKING)
                               Row(
                                children: [
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
                              const SizedBox(width: TSizes.defaultSpace),

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
                                  // SizedBox(
                                  //   width: double.infinity,
                                  //   height: 45,
                                  //   child: ElevatedButton(
                                  //     onPressed: () {
                                  //         if (_formKey.currentState!.validate()) {
                                  //            final image = imageNotifier.value;
                                  //            final banner = imageBannerNotifier.value;

                                  //           if (image == null || banner == null ) {
                                  //             print("Please select image");
                                  //             return;
                                  //           }

                                  //           categoryController.uploadCategory(
                                  //            pickedImage: image.bytes!.toList(),      // ✅ List<int>
                                  //            pickedBanner: banner.bytes!.toList(), 
                                  //            name: nameController.text.trim(),
                                  //            context: context,    // ✅ List<int>
                                  //           );
                                  //         }
                                  //       },
                                  //       style: ElevatedButton.styleFrom(
                                  //       backgroundColor:
                                  //           const Color(0xff5867ff),
                                  //     ),
                                  //     child: const Text('Create'),
                                  //   ),
                                  // ),
                                  Obx(() => SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: categoryController.isUploading.value
                                        ? null
                                        : () {
                                            if (_formKey.currentState!.validate()) {
                                              final image = imageNotifier.value;
                                              final banner = imageBannerNotifier.value;

                                              if (image == null || banner == null) {
                                                Get.snackbar("Error", "Please select both images");
                                                return;
                                              }

                                              categoryController.uploadCategory(
                                                pickedImage: image.bytes!.toList(),
                                                pickedBanner: banner.bytes!.toList(),
                                                name: nameController.text.trim(),
                                                context: context,
                                              );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff5867ff),
                                    ),
                                    child: categoryController.isUploading.value
                                        ? const SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.5,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Text('Create'),
                                  ),
                                )),

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
