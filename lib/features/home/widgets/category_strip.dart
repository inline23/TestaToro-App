import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

class CategoryStrip extends StatelessWidget {
  const CategoryStrip({super.key});

  static const _items = [
    'NEW IN',
    'LIMITED STOCK',
    'SNEAKERS',
    'BOOTS',
    'BAGS',
    'ACCESSORIES',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (final item in _items)
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  item,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
