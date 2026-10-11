import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

/// PLACEHOLDER: replace with the real Cart screen when it exists.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Cart')),
      body: const Center(child: Text('Cart coming soon')),
    );
  }
}
