import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const Topbar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Menu button
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),

          // Search bar
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xfff6f7f9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search things...',
                      style: TextStyle(color: Colors.grey), 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: screenWidth * 0.02), // responsive spacing

          // Notification, settings, and user info
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.purple[50],
                child: const Icon(Icons.notifications, color: Colors.blue),
              ),
              SizedBox(width: screenWidth * 0.015),
              CircleAvatar(
                backgroundColor: Colors.purple[50],
                child: const Icon(Icons.settings, color: Colors.blue),
              ),
              SizedBox(width: screenWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Hey Support',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'support@tim_net.com',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
