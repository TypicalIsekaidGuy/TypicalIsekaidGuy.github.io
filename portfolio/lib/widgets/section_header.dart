import 'package:flutter/material.dart';

import '../theme.dart';

/// Заголовок секции: малый лейбл + крупный заголовок + акцентная линия.
class SectionHeader extends StatelessWidget {
  final String label;
  final String title;

  const SectionHeader({super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 2,
              decoration: BoxDecoration(
                gradient: AppTheme.heroGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(label.toUpperCase(), style: AppTheme.label()),
          ],
        ),
        const SizedBox(height: 14),
        Text(title, style: AppTheme.heading()),
      ],
    );
  }
}
