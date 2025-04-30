import 'package:flutter/material.dart';

class PresensiChip extends StatelessWidget {
  final String jam;

  const PresensiChip({super.key, required this.jam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'icons/ic_clock.png',
            height: 16,
            width: 16,
          ),
          const SizedBox(width: 4),
          Text(
            jam,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
