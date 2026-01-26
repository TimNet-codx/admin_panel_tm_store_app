import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrdersDonutCard extends StatelessWidget {
  const OrdersDonutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;

        // Responsive sizes
        double chartHeight = isMobile ? 180 : 260;
        double centerRadius = isMobile ? 28 : 40;
        double mainSliceRadius = isMobile ? 45 : 60;
        double smallSliceRadius = isMobile ? 14 : 20;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orders Status',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: chartHeight,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: centerRadius,
                    sections: _sections(mainSliceRadius, smallSliceRadius),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              _legend(isMobile),
            ],
          ),
        );
      },
    );
  }

  // ---------- PIE CHART SECTIONS (Responsive Radii) ----------
  List<PieChartSectionData> _sections(
      double largeRadius, double smallRadius) {
    return [
      PieChartSectionData(
          value: 330,
          color: Colors.grey.shade400,
          showTitle: false,
          radius: largeRadius),
      PieChartSectionData(
          value: 6, color: Colors.orange, showTitle: false, radius: smallRadius),
      PieChartSectionData(
          value: 3, color: Colors.blue, showTitle: false, radius: smallRadius),
      PieChartSectionData(
          value: 6, color: Colors.green, showTitle: false, radius: smallRadius),
      PieChartSectionData(
          value: 4, color: Colors.red, showTitle: false, radius: smallRadius),
      PieChartSectionData(
          value: 1, color: Colors.teal, showTitle: false, radius: smallRadius),
    ];
  }

  // ---------- RESPONSIVE LEGEND ----------
  Widget _legend(bool isMobile) {
    final rows = [
      ['Pending', '330', Colors.grey.shade400],
      ['Processing', '6', Colors.orange],
      ['Shipped', '3', Colors.blue],
      ['Delivered', '6', Colors.green],
      ['Cancelled', '4', Colors.red],
      ['Refunded', '1', Colors.teal],
    ];

    if (isMobile) {
      // 2-column legend for small screen
      return Wrap(
        spacing: 20,
        runSpacing: 10,
        children: rows.map((r) {
          return SizedBox(
            width: 140,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: r[2] as Color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(r[0] as String, overflow: TextOverflow.ellipsis)),
                Text(r[1] as String),
              ],
            ),
          );
        }).toList(),
      );
    }

    // Desktop/tablet: full width legend rows
    return Column(
      children: rows.map((r) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: r[2] as Color,
                        shape: BoxShape.circle,
                      )),
                  const SizedBox(width: 8),
                  Text(r[0] as String),
                ],
              ),
              Text(r[1] as String),
            ],
          ),
        );
      }).toList(),
    );
  }
}
