import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // final String Icons;
  final String title;
  final String value;
  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle), child: const Icon(Icons.account_balance_wallet, color: Colors.blue)),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)))
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: const [Icon(Icons.arrow_upward, color: Colors.green, size: 16), SizedBox(width: 6), Text('100.0% Compared to 2024', style: TextStyle(color: Colors.green, fontSize: 12))])
        ],
      ),
    );
  }
}