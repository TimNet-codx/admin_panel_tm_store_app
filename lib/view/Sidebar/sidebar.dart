import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        height: 1000,
        color: const Color(0xff0f1720),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(6)),
                  child: const Icon(Icons.admin_panel_settings, color: Colors.white),
                ),
                const SizedBox(width: 8),
                const Text(
                  'T Store Admin',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text('OVERVIEW & MEDIA',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 10),
            _sideItem(icon: Icons.dashboard, label: 'Dashboard', route: '/dashboard', selected: true, context: context, ),
            _sideItem(icon: Icons.perm_media, label: 'Media',
              route: '/media',
              //  selected: true, 
              context: context, ),
            const SizedBox(height: 18),
            const Text('DATA MANAGEMENT',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 10),
            _sideItem(icon: Icons.category, context: context, route: '/categories', label: 'Categories'),
            _sideItem(icon: Icons.subdirectory_arrow_right, context: context, route: '/subcategories', label: 'Sub Categories'),
            _sideItem(icon: Icons.branding_watermark, context: context, route: '/brands', label: 'Brands'),
            const SizedBox(height: 18),
            const Text('PRODUCT MANAGEMENT',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 10),
            _sideItem(icon: Icons.add, context: context, route: '/add-product', label: 'Add new product'),
            _sideItem(icon: Icons.inventory, context: context, route: '/products', label: 'Products'),
            _sideItem(icon: Icons.people, context: context, route: '/products', label: 'Customers'),
            _sideItem(icon: Icons.delivery_dining, context: context, route: '/orders', label: 'Orders'),
            _sideItem(icon: Icons.star, context: context, route: '/orders', label: 'Product Reviews'),
            const SizedBox(height: 18),
            const Text('PROMOTION MANAGEMENT',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 10),
            _sideItem(icon: Icons.flag, context: context, route: '/banners', label: 'Banners'),
            const SizedBox(height: 18),
            const Text('Customer MANAGEMENT',
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 10),
            _sideItem(icon: Icons.person_4, context: context, route: '/ventor', label: 'Ventor'),
            _sideItem(icon: Icons.person, context: context, route: '/buyers', label: 'Buyers'),

          ],
        ),
      ),
    );
  }

  Widget _sideItem({
    required IconData icon,
    required String label,
    required String route,
    bool selected = false,
     required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon,
                color: selected ? Colors.white : Colors.white60, size: 18),
            const SizedBox(width: 10),
            Text(label,
                style: TextStyle(
                    color: selected ? Colors.white : Colors.white60,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
