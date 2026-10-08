import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';
import 'package:testa_toro/core/widgets/app_network_image.dart';
import 'package:testa_toro/features/products/models/product_model.dart';

class HomeProductCard extends StatelessWidget {
  final ProductModel product;

  const HomeProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppNetworkImage(
            url: product.primaryImageUrl,
            width: double.infinity,
            height: double.infinity,
            memCacheWidth: 600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          product.description ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          '${product.basePrice.toStringAsFixed(0)} EGP',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
