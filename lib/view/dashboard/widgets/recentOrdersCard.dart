import 'package:flutter/material.dart';

class RecentOrdersCard extends StatelessWidget {
  const RecentOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['#b7d31', '09/12/2025', '1 Items', 'Pending', '\\564'],
      ['#006d7', '08/12/2025', '1 Items', 'Pending', '\\540.8'],
      ['#5e6d7', '03/12/2025', '1 Items', 'Pending', '\\400'],
      ['#0fd6a', '29/11/2025', '1 Items', 'Pending', '\\450'],
      ['#97f14', '29/11/2025', '1 Items', 'Pending', '\\40'],
    ];

    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      width: width,       // <-- Responsive width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent Orders', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),

          // Horizontal scroll for small screens
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: width,   // <-- Prevents shrinking
              ),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Order ID')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Items')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Amount')),
                ],
                rows: rows
                    .map((r) => DataRow(
                          cells: r.map((c) => DataCell(Text(c))).toList(),
                        ))
                    .toList(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          const Text('Showing 5 Row(s)',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
