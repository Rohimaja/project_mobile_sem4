import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PerkuliahanChip extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  const PerkuliahanChip({
    super.key,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: AutoSizeText(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
              maxLines: 1,
              minFontSize: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
