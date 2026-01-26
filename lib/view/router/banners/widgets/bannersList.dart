// import 'package:admin_panel_tm_store_app/view/router/banners/widgets/CreateBanner.dart';
// import 'package:admin_panel_tm_store_app/view/router/categories/widgets/valueNotifier.dart';
// import 'package:flutter/material.dart';

// class BannersListScreen extends StatelessWidget {
//   const BannersListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final rows = [
//       {'id': 1, 'name': 'Puertas', 'featured': true, 'status': true, 'date': '06/12/2025 at 10:16'},
//       {'id': 2, 'name': 'Jewelery', 'featured': true, 'status': false, 'date': '23/11/2025 at 03:16'},
//       {'id': 3, 'name': 'Cosmetics', 'featured': true, 'status': false, 'date': '21/11/2025 at 03:16'},
//       {'id': 4, 'name': 'Shoes', 'featured': true, 'status': false, 'date': '18/11/2025 at 03:16'},
//       {'id': 5, 'name': 'Animals', 'featured': true, 'status': false, 'date': '15/11/2025 at 03:16'},
//       {'id': 6, 'name': 'Clothes', 'featured': true, 'status': false, 'date': '13/11/2025 at 03:16'},
//       {'id': 7, 'name': 'Electronics', 'featured': true, 'status': false, 'date': '08/11/2025 at 03:16'},
//       {'id': 8, 'name': 'Furniture', 'featured': true, 'status': false, 'date': '05/11/2025 at 03:16'},
//     ];

//     return Expanded(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // breadcrumb + title + create button + search
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(children: const [Text('Dashboard', style: TextStyle(color: Colors.grey)), SizedBox(width: 8), Icon(Icons.chevron_right, size: 16), SizedBox(width: 8), Text('All Banners', style: TextStyle(fontWeight: FontWeight.bold))]),
              
//               ],
//             ),
//              const SizedBox(height: 12),
//              SizedBox(
//               width: 200,
//               height: 45,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute( 
//                       builder: (context) => CreateBannerScreen(
//                         imageNotifier: imageNotifier, // ✅ correct
//                         onPickImage: pickedImage,        // ✅ correct
//                       ),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text('Create New Banner'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xff3f5efb),
//                 ),
//               ),
//             ),




//             const SizedBox(height: 12),
//             Container(
//               padding: const EdgeInsets.all(14),
//               decoration: BoxDecoration(color: const Color(0xffe9eef4), borderRadius: BorderRadius.circular(8)),
//               child: Row(children: const [Icon(Icons.search), SizedBox(width: 8), Expanded(child: Text('Search...'))]),
//             ),
//             const SizedBox(height: 18),
        
//             // table card
//             Container(
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
//               padding: const EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: SizedBox(
//                   width: 2000, // large width to mimic wide table; on small screens it scrolls horizontally
//                   child: DataTable(
//                     columnSpacing: 24,
//                     headingRowColor: MaterialStateProperty.all(const Color(0xfff1f4f7)),
//                     columns: const [
//                       DataColumn(label: Text('Ser')),
//                       DataColumn(label: Text('Banner')),
//                       DataColumn(label: Text('Featured')),
//                       DataColumn(label: Text('Status')),
//                       DataColumn(label: Text('Date')),
//                       DataColumn(label: Text('Action')),
//                     ],
//                     rows: rows.map((r) {
//                       return DataRow(cells: [
//                         DataCell(Text('${r['id']}')),
//                         DataCell(Row(
//                           children: [
//                             Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8))),
//                             const SizedBox(width: 8),
//                             Text(r['name'] as String),
//                           ],
//                         )),
//                         DataCell(_chipFeatured(r['featured'] as bool)),
//                         DataCell(_chipStatus(r['status'] as bool)),
//                         DataCell(Text(r['date'] as String)),
//                         DataCell(Row(
//                           children: [
//                             IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Color(0xff5eb1ff))),
//                             IconButton(onPressed: () {}, icon: const Icon(Icons.delete, color: Color(0xffff6b6b))),
//                           ],
//                         )),
//                       ]);
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _chipFeatured(bool active) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(color: active ? const Color(0xffeef4ff) : Colors.grey.shade100, borderRadius: BorderRadius.circular(20), border: Border.all(color: active ? const Color(0xff5867ff) : Colors.grey.shade300)),
//       child: Row(children: [Icon(active ? Icons.check_circle : Icons.circle_outlined, size: 16, color: active ? const Color(0xff5867ff) : Colors.grey), const SizedBox(width: 8), Text(active ? 'Active' : 'Inactive')]),
//     );
//   }

//   Widget _chipStatus(bool active) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
//       child: Row(children: [Text(active ? 'Active' : 'Inactive'), const SizedBox(width: 8), CircleAvatar(radius: 8, backgroundColor: active ? const Color(0xff5867ff) : Colors.white, child: active ? const Icon(Icons.check, size: 12, color: Colors.white) : const Icon(Icons.circle_outlined, size: 12, color: Colors.black12))]),
//     );
//   }
// }
import 'package:admin_panel_tm_store_app/PickedImage/valueNotifier.dart';
import 'package:admin_panel_tm_store_app/controllers/banner_Controller.dart';
import 'package:admin_panel_tm_store_app/models/banner.dart';
import 'package:admin_panel_tm_store_app/utils/formatters/formatter.dart';
import 'package:admin_panel_tm_store_app/view/router/banners/widgets/CreateBanner.dart';
import 'package:flutter/material.dart';

class BannersListScreen extends StatelessWidget {
  const BannersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final BannerController bannerController = BannerController(); 

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // breadcrumb + title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text('Dashboard', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, size: 16),
                    SizedBox(width: 8),
                    Text('All Banners', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // create button
                     SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute( 
                      builder: (context) => CreateBannerScreen(
                        imageNotifier: imageNotifier, // ✅ correct
                        onPickImage: pickedImage,        // ✅ correct
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Create New Banner'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3f5efb),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // search box (UI only for now)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xffe9eef4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Expanded(child: Text('Search...')),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // TABLE (API DATA)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: FutureBuilder<List<BannerModel>>(
                future: bannerController.getBanners(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final banners = snapshot.data!;

                  if (banners.isEmpty) {
                    return const Center(
                      child: Text('No banners found'),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 1600,
                      child: DataTable(
                        columnSpacing: 24,
                        headingRowColor: MaterialStateProperty.all(const Color(0xfff1f4f7)),
                        columns: const [
                        DataColumn(label: SizedBox( width: 50, child: Text('Ser', overflow: TextOverflow.ellipsis,),),),
                          DataColumn(label: Text('Id')),
                          DataColumn(label: Text('Banner')),
                          DataColumn(label: Text('Title')),
                          DataColumn(label: Text('Decription')),  
                          DataColumn(label: Text('Featured')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: List.generate(banners.length, (index) {
                          final banner = banners[index];

                          return DataRow(cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text(banner.id)), // replace when API supports it// replace when API supports it                        
                            // banner image + title
                            DataCell(Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    banner.image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Text(banner.title),
                              ],
                            )),
                            DataCell(Text(banner.title),),
                            DataCell(Text(banner.description),), // replace when API supports it// replace when API supports it
                            DataCell(_chipFeatured(true)), // replace when API supports it, // replace when API supports it
                            DataCell(_chipStatus(true)),   // replace when API supports it
                            // DataCell(Text(DateTime.now().toString())),
                            DataCell(Text(TFormatter.formatDate (banner.createdAt))),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit, color: Color(0xff5eb1ff)),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete, color: Color(0xffff6b6b)),
                                ),
                              ],
                            )),
                          ]);
                        }),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chipFeatured(bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: active ? const Color(0xffeef4ff) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active ? const Color(0xff5867ff) : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            active ? Icons.check_circle : Icons.circle_outlined,
            size: 16,
            color: active ? const Color(0xff5867ff) : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(active ? 'Active' : 'Inactive'),
        ],
      ),
    );
  }

  Widget _chipStatus(bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Text(active ? 'Active' : 'Inactive'),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 8,
            backgroundColor: active ? const Color(0xff5867ff) : Colors.white,
            child: active
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : const Icon(Icons.circle_outlined, size: 12, color: Colors.black12),
          ),
        ],
      ),
    );
  }
}
