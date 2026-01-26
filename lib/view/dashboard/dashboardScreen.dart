import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/view/Sidebar/sidebar.dart';
import 'package:admin_panel_tm_store_app/view/dashboard/widgets/barChartCard.dart';
import 'package:admin_panel_tm_store_app/view/dashboard/widgets/infoCard.dart';
import 'package:admin_panel_tm_store_app/view/dashboard/widgets/ordersDonutCard.dart';
import 'package:admin_panel_tm_store_app/view/dashboard/widgets/recentOrdersCard.dart';
import 'package:admin_panel_tm_store_app/view/topbar/topbar.dart';

import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showSidebar = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
   // final args = ModalRoute.of(context)!.settings.arguments as Map?;

    return Scaffold(
      body: Row(
        children: [
          if (!isMobile)  Sidebar(),
          Expanded(
            child: Column(
              children: [
                Topbar(
                  onMenuTap: () {
                    if (isMobile) {
                      // open drawer or toggle sidebar - for simplicity show modal
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const SizedBox(height: 400, child: Sidebar()),
                      );
                    }
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 12000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: TSizes.sm),
                          const Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: TSizes.md),
                          // Info cards
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: const [
                              InfoCard(title: 'Sales total', value: ''),
                              InfoCard(title: 'Average Order Value', value: ''),
                              InfoCard(title: 'Total Orders', value: '350'),
                              InfoCard(title: 'Sold Products', value: '533'),
                            ],
                          ),

                        const SizedBox(height: TSizes.lg),

                          // charts and recent orders
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: const [
                                    WeeklyBarChartCard(),
                                    SizedBox(height: TSizes.md),
                                    //RecentOrdersCard(),
                                  ],
                                ),
                              ),
                              SizedBox(width: TSizes.lg),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    OrdersDonutCard(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: TSizes.md),
                          RecentOrdersCard()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

