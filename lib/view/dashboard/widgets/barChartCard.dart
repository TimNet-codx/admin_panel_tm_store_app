import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChartCard extends StatelessWidget {
  const WeeklyBarChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1000;

        // Responsive dynamic sizes
        double barWidth = isMobile ? 10 : isTablet ? 14 : 18;
        double chartHeight = isMobile ? 260 : isTablet ? 340 : 420;

        return Container(
          padding: const EdgeInsets.all(16),
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Weekly Sales',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 8),

              SizedBox(
                height: chartHeight,       // <-- Responsive height
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 600,

                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.shade200,
                        dashArray: [4, 4],
                      ),
                    ),

                    borderData: FlBorderData(show: false),

                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 100,
                          reservedSize: isMobile ? 30 : 40,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: isMobile ? 9 : 11),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const labels = [
                              'Mon', 'Tue', 'Wed', 
                              'Thu', 'Fri', 'Sat', 'Sun'
                            ];
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                labels[value.toInt() % labels.length],
                                style: TextStyle(fontSize: isMobile ? 10 : 12),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    barGroups: _createGroups(barWidth),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _createGroups(double barWidth) {
    final values = [480.0, 500.0, 360.0, 0.0, 0.0, 520.0, 540.0];

    return List.generate(values.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i],
            width: barWidth,                    // <-- Responsive bar width
            borderRadius: BorderRadius.circular(6),
            color: Colors.blue,
          )
        ],
      );
    });
  }
}
