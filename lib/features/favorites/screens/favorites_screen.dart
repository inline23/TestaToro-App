import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

/// PLACEHOLDER: replace with the real Favorites screen when it exists.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Favorites')),
      body: const Center(child: Text('Favorites coming soon')),
    );
  }
}
