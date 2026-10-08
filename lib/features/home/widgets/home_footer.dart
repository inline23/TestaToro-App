import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  static const _links = [
    'SHIPPING & RETURNS',
    'SIZE GUIDE',
    'CONTACT US',
    'FAQ',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.bg,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final link in _links)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                link,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          const SizedBox(height: 16),
          const Text(
            '© 2026 TESTATORO. ALL RIGHTS RESERVED.',
            style: TextStyle(fontSize: 9, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
